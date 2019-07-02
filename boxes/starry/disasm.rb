# coding: utf-8

class Starry

  class ProgramError < Exception; end

  OP_STACK = [:__dummy__, :dup, :swap, :rotate, :pop]
  OP_CALC = [:+, :-, :*, :/, :%]
  OP_OUTPUT = [:num_out, :char_out]
  OP_INPUT = [:num_in, :char_in]

  attr_reader :insns

  def self.run(src)
    new(src).run
  end

  def initialize(src)
    @insns = parse(src)
  end

  private

  def parse(src)
    insns = []

    spaces = 0
    src.each_char do |c|
      case c
      when " "
        spaces += 1
      when "+"
        raise ProgramError, "0個の空白のあとに+が続きました" if spaces == 0
        if spaces < OP_STACK.size
          insns << select(OP_STACK, spaces)
        else
          insns << [:push, spaces - OP_STACK.size]
        end
        spaces = 0
      when "*"
        insns << select(OP_CALC, spaces)
        spaces = 0
      when "."
        insns << select(OP_OUTPUT, spaces)
        spaces = 0
      when ","
        insns << select(OP_INPUT, spaces)
        spaces = 0
      when "`"
        insns << [:label, spaces]
        spaces = 0
      when "'"
        insns << [:jump, spaces]
        spaces = 0
      end
    end

    insns
  end

  def select(ops, n)
    op = ops[n % ops.size]
    [op]
  end

  def find_labels(insns)
    labels = {}
    insns.each_with_index do |(insn, arg), i|
      if insn == :label
        raise ProgramError, "ラベル#{arg}が重複しています" if labels[arg]
        labels[arg] = i
      end
    end
    labels
  end

end

require 'pp'
pp Starry.new(ARGF.read).insns
