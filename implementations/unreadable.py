#!/usr/bin/env python
# Unreadable interpreter

# This progrom was coppied from esolangs.org by User:Marinus, licensed under CC0.

import sys, re

# if your programs are so huge you run into the recursion limit,
# you might try increasing this number.
# be warned though that increasing it much further might cause python to crash
sys.setrecursionlimit(13500)

class Parser:
   class ParseError(Exception): pass

   class Expression:
      # commands and their numbers
      PRINT,INC,ONE,DO,WHILE,SET,GET,DEC,IF,IN =\
        1  , 2 , 3 , 4,  5  , 6 , 7 , 8 , 9,10

      # amount of arguments
      ARGNS = {PRINT: 1, INC: 1, ONE: 0, DO: 2, WHILE: 2, SET: 2,
               GET: 1, DEC: 1, IF: 3, IN: 0}

      def __init__(self, command, args):
         self.command = command
         self.args = args

      # get a semi-human-readable representation of the Unreadable program
      def __str__(self):
         strreps = ['', 'print ', 'inc ', '1', 'do ', 'while ', 'set ',
                    'get ', 'dec ', 'if ', 'in']

         return '(' + strreps[self.command] + \
                ', '.join(map(str, self.args)) + ')'



   # parse an expression, return (Expr, rest)
   # assumes all non-('") chars have already been removed
   # from input string
   @staticmethod
   def parse(pgm):
      # empty program
      if pgm == "":
         raise Parser.ParseError("empty program or too few arguments")

      # program must begin with "'"
      if pgm[0] != "'":
         raise Parser.ParseError("invalid expression: %s" % pgm)

      # find end-of-string or next "'"
      command = 0
      index = 1
      while index < len(pgm) and pgm[index] != "'":
         if pgm[index] == '"': command += 1
         index += 1

      if not 1 <= command <= 10:
         raise Parser.ParseError("invalid command (%d): %s" % (command, pgm[:index]))

      # parse arguments
      rest = pgm[index:]
      args = []
      argn = Parser.Expression.ARGNS[command]

      for i in range(argn):
         arg, rest = Parser.parse(rest)
         args.append(arg)

      # return expression + leftovers
      return Parser.Expression(command, args), rest

   # turn a program into a list of parsed expressions
   @staticmethod
   def parseexprs(pgm):
      # remove all unused characters
      pgm = re.sub("[^\"']", "", pgm)

      rest = pgm
      exprs = []
      while rest:
         exp, rest = Parser.parse(rest)
         exprs.append(exp)

      return exprs

# array that grows automatically
class Array:
   def __init__(self, list = None, defaultval = 0):
      self.list = list[:] if list else []
      self.defaultval = defaultval

   def __getitem__(self, x):
      if x < len(self.list):
         return self.list[x]
      else:
         return self.defaultval

   def __setitem__(self, x, val):
      if x >= len(self.list):
         self.list += [self.defaultval] * (x - len(self.list) + 1)
      self.list[x] = val

# interpreter
class Interpreter:

   # commands
   def print_(self, x):
      x = self.eval(x)
      # try unicode character, if it fails, truncate to normal char.
      try:
         sys.stdout.write(unichr(x))
      except UnicodeEncodeError:
         sys.stdout.write(chr(x % 256))
      return x

   def inc(self, x): return self.eval(x) + 1
   def one(self): return 1
   def do(self, x, y):
      self.eval(x)
      return self.eval(y)

   def while_(self, x, y):
      while self.eval(x):
         result = self.eval(y)
      return result

   def set(self, x, y):
      r = self.eval(y)
      self.vars[self.eval(x)] = r
      return r

   def get(self, x): return self.vars[self.eval(x)]
   def dec(self, x): return self.eval(x) - 1
   def if_(self, x, y, z):
      if self.eval(x):
         return self.eval(y)
      else:
         return self.eval(z)

   def in_(self):
      ch = sys.stdin.read(1)
      return ord(ch) if ch else -1

   # evaluate an expression
   def eval(self, expr):
      # easy, isn't it?
      return self.cmds[expr.command](*expr.args)

   # run the program (just evaluate all root exprs in order)
   def run(self):
      map(self.eval, self.pgm)

   def __init__(self, pgm):
      self.pgm = pgm
      self.vars = Array()
      e = Parser.Expression
      self.cmds = { e.PRINT: self.print_,
                    e.INC:   self.inc,
                    e.ONE:   self.one,
                    e.DO:    self.do,
                    e.WHILE: self.while_,
                    e.SET:   self.set,
                    e.GET:   self.get,
                    e.DEC:   self.dec,
                    e.IF:    self.if_,
                    e.IN:    self.in_ }

def main(argv):
   if not len(argv) in (2, 3) or len(argv)==3 and argv[1] != '-show':
      print "Usage: %s [-show] program" % argv[0]
      print "\tIf the -show flag is given, the program is parsed and"
      print "\toutput. If not, the program is executed."
      sys.exit()

   try:
      pgm = file(argv[-1]).read()
   except Exception, e:
      print "error: cannot read file %s: %s" % (argv[-1], e)
      sys.exit()

   try:
      exprs = Parser.parseexprs(pgm)
   except Exception, e:
      print "error: parser failed: %s" % e
      sys.exit()

   if argv[1]=='-show':
      for expr in exprs:
         print expr
   else:
      try:
         Interpreter(exprs).run()
      except Exception, e:
         print "runtime error: %s" % e

if __name__ == '__main__': main(sys.argv)
