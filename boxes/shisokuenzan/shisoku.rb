# coding: utf-8
class Tree
  def initialize(value)
    @value = value
    @left
    @right
  end

  attr_accessor :value, :right, :left

  def set_children(left, right)
    @left = left
    @right = right
  end

  def show
    @left.show unless @left.nil?
    print @value
    @right.show unless @right.nil?
  end

  def text
    text = ""
    text += @left.text unless @left.nil?
    text += @value
    text += @right.text unless @right.nil?
    text
  end

  def calc
    if @value == "+"
      @left.calc + @right.calc
    elsif @value == "-"
      @left.calc - @right.calc
    elsif @value == "*"
      @left.calc * @right.calc
    elsif @value == "/"
      @left.calc / @right.calc
    else
      @value.to_i
    end
  end

  def check?
    if value == "="
      l = @left.calc
      r = @right.calc
      l == r
    else
      @value == "/" and @right.value == "0"
    end
  end
end

class Memory
  def initialize(trees, input)
    @trees = trees
    @input = input
    @memory = []
    256.times {@memory << 0}
    @counter = 0
  end

  attr_accessor :memory, :counter

  def both_operator(left, right)
    ll = left.left.calc
    lr = left.right.calc
    rl = right.left.calc
    rr = right.right.calc
    if @memory[ll] == @memory[lr]
      @counter += @memory[rl]
    else
      @counter += @memory[rr]
    end
  end

  def left_operator(left, right)
    l = left.left.calc
    r = left.right.calc
    target = right.calc
    @memory[target] = eval("#{@memory[l]} #{left.value} #{@memory[r]}")
  end

  def right_operator(left, right)
    l = right.left.calc
    r = right.right.calc
    target = left.calc
    case right.value
    when "+"
      @memory[l] = @memory[target]
      @memory[r] = @memory[target]
    when "-"
      if @memory[target] < @memory[l]
        @counter -= @memory[r]
      end
    when "*"
      if @memory[l] < @memory[r]
        print @memory[target].chr
      else
        print @memory[target]
      end
    when "/"
      i = @input.shift
      if @memory[l] < @memory[r]
        @memory[target] = i.ord
      else
        @memory[target] = i.to_i
      end
    end
  end

  def operator?(char)
    char == "+" || char == "-" || char == "*" || char == "/"
  end

  def exec_one_step
    tree = @trees[@counter]
    if tree.value == "/"
      value = tree.left.calc
      @counter += @memory[value]
    elsif tree.value == "="
      if operator? tree.left.value and operator? tree.right.value # a + b = c + d
        both_operator tree.left, tree.right
      elsif operator? tree.left.value # a + b = c
        left_operator tree.left, tree.right
      elsif operator? tree.right.value # a = b + c
        right_operator tree.left, tree.right
      else # a = a
        l = tree.left.calc
        r = tree.right.calc
        @memory[l] = r
      end
    end
    @counter += 1
    #p @memory #メモリの中身を出力
  end

  def finish?
    @counter >= @trees.length
  end
end

def to_rpn(chars)
  output = []
  stack = []
  a = nil
  chars.each do |token|
    token = token.first
    case token
    when "(" then stack << token
    when ")"
      output << a until (a = stack.pop) == "("
    when "*", "/"
      loop do
        a = stack.last
        break unless %w(* /).include? a
        output << stack.pop
      end
      stack << token
    when "+", "-"
      loop do
        a = stack.last
        break unless %w(+ - * /).include? a
        output << stack.pop
      end
      stack << token
    else
      output << token
    end
  end
  output << a while a = stack.pop
  output
end

def calculate(parsed)
  stack = []
  while x = parsed.shift
    if parsed.length == 0
      stack << x
      break
    elsif %w(+ - * /).include? x
      a, b = stack.pop, stack.pop
      stack << eval("#{b} #{x} #{a}")
    else
      stack << x
    end
  end
  stack
end

def make_tree(chars)
  rpn = to_rpn chars
  calc = calculate rpn
  root = Tree.new calc.last
  if calc.length == 3
    left = Tree.new calc[0].to_s
    right = Tree.new calc[1].to_s
    root.set_children left, right
  end
  root
end

def parse(chars)
  if chars.include? ["="]
    eq = chars.index ["="]
    left = make_tree chars[0..eq - 1]
    right = make_tree chars[eq + 1..-1]
    ret = Tree.new("=")
    ret.set_children left, right
    ret
  else
    make_tree(chars)
  end
end

def execute(trees, input)
  counter = 0
  memory = Memory.new trees, input
  until memory.finish?
    memory.exec_one_step
  end
end

def main
  trees = []

  File.open(ARGV[0], mode="rt"){|f|
    f.each_line {|l|
      ch = l.scan(/([0-9\.]+|\+|\-|\*|\/|\(|\)|=)/)
      unless ch.empty?
        pa = parse ch
        trees << pa
      end
    }
  }

  if trees.all? {|tree| tree.check?}
    input = STDIN.read
    input = input.chars unless input.nil?
    execute trees, input
  else
    trees.each_with_index do |tree, i|
      unless tree.check?
        puts "line#{i + 1}:#{tree.text} is wrong!"
      end
    end
  end
end

if __FILE__ == $0
  main
end
