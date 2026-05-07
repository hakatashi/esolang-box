require "spec_helper"
require "timeout"
require "fileutils"
require "yaml"

ENABLE_STRACE = !ENV['ENABLE_STRACE'].nil?

# Load all language metadata from boxes/*/language.yaml
BOXES = Dir.glob(File.join(__dir__, '..', 'boxes', '*', 'box.yaml'))
  .sort
  .each_with_object({}) do |path, h|
    box_id = File.basename(File.dirname(path))
    raw = File.read(path, encoding: 'utf-8')
    h[box_id] = YAML.safe_load(raw) || {}
  end

describe 'esolang-box', v2: true do
  def result_of(language, file, stdin = nil, container_timeout = 180, options = nil)
    FileUtils.mkdir_p 'spec/tmp'
    FileUtils.cp File.join('boxes', language, 'assets', file), 'spec/tmp/CODE'

    config = {
      'Image' => "esolang/#{language}",
      'NetworkDisabled' => true,
      'Volumes' => {
        '/assets' => {},
      },
      'HostConfig' => {
        'Binds' => ["#{File.expand_path('spec/tmp').gsub(/^C:/, '/c').gsub(/^\/mnt/, '')}:/volume#{ENABLE_STRACE ? '' : ':ro'}"],
      },
      'Cmd' => ['sleep', '999999'],
    }

    options_list = if options.nil?
      []
    else
      options.split(' ')
    end

    exec_opts = { wait: container_timeout }

    if stdin.nil?
      exec_cmd = [language, *options_list, '/volume/CODE']
    else
      File.write('spec/tmp/STDIN', stdin)
      exec_cmd = ['/bin/sh', '-c', "#{language} #{options_list.join(' ')} /volume/CODE < /volume/STDIN"]
    end

    if ENABLE_STRACE
      exec_opts[:env] = ['STRACE_OUTPUT_PATH=/volume/strace.log']
      config['HostConfig']['CapAdd'] = ['SYS_PTRACE']
    end

    container = Docker::Container.create(config)
    container.start

    starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

    stdouts = []
    begin
      2.times do
        stdout_chunks, stderr_chunks = container.exec(exec_cmd, exec_opts)
        stdout = stdout_chunks.join
        stderr = stderr_chunks.join
        if !stderr.empty?
          STDERR.print stderr
        end
        stdouts << stdout
      end
    rescue
      raise $!
    ensure
      container.refresh!
      if container.info['State']['Running']
        container.kill
      end
      container.remove
    end

    ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)

    if ENABLE_STRACE
      FileUtils.mkdir_p 'spec/strace'
      FileUtils.cp 'spec/tmp/strace.log', File.join('spec/strace', "#{language}_#{file.split('.').first}.log")
      File.write File.join('spec/strace', "#{language}_#{file.split('.').first}.txt"), "elapsed: #{ending - starting}"
    end

    FileUtils.remove_dir 'spec/tmp', true

    stdouts.map { |s| s.force_encoding('UTF-8') }
  end

  BOXES.each_pair do |box_id, box_data|
    tests = box_data['tests'] || {}
    next if tests.empty?

    disabled = box_data['disabled'] || false
    lang_skip = box_data['skip']

    # Skip disabled BOXES that have no skip message
    next if disabled && lang_skip.nil?

    describe_opts = disabled ? { skip: lang_skip, box_id: box_id } : { box_id: box_id }

    describe box_id, **describe_opts do
      container_timeout = box_data['container_timeout'] || 180

      tests.each_pair do |lang_case_id, test_data|
        test_skip = test_data['skip']
        test_target = "Output of running #{test_data['file']}"
        if !test_data['stdin'].nil?
          test_target += " with stdin #{test_data['stdin'].inspect}"
        end
        if !test_data['options'].nil?
          test_target += " with options #{test_data['options']}"
        end
        expected = test_data['expected']
        test_name = "#{test_target} should be #{expected.inspect}"
        if expected.nil? && !test_data['expected_file'].nil?
          expected = File.read(File.join('boxes', box_id, 'assets', test_data['expected_file']), encoding: 'utf-8')
          test_name = "#{test_target} should be the same as #{test_data['expected_file']}"
        end

        case_id = "#{box_id}-#{lang_case_id}"

        if test_skip
          it(test_name, case_id: case_id, skip: test_skip) {}
        else
          it(test_name, case_id: case_id) do
            results = result_of(box_id, test_data['file'], test_data['stdin'], container_timeout, test_data['options'])
            expect(results[0]).to eql(expected)
            expect(results[1]).to eql(expected)
          end
        end
      end
    end
  end
end
