#!/usr/bin/env python

import re
import sys

START = re.compile(r'(=|[,\';][ ,\';]*|[.`:][ .`:]*)(.*)')
PAIRS = re.compile(r'(\d+)(-|\+|[,\';][ ,\';]*|[.`:][ .`:]*)')
QUADS = {
    ';': -3,
    "'": -2,
    ',': -1,
    '=': 0,
    ' ': 0,
    '.': 1,
    '`': 2,
    ':': 3}


class Node(object):

    def __init__(self, id, threshold, to):
        self.id = id
        self.threshold = threshold
        self.to = to

        self.level = 0
        self.new_level = 0

    def clear(self):
        self.level = self.new_level
        self.new_level = 0

    def signal(self, val):
        self.new_level += val

    def tick(self):
        if self.level >= self.threshold:
            #print('(%d) Tick' % (self.id, ))
            return self.to
        else:
            return {}

    def __repr__(self):
        msg = '<Node %d, threshold: %r; to: %r>'
        return msg % (self.id, self.threshold, self.to)


class Stdout(Node):

    def __init__(self):
        self.id = -1
        self.threshold = 0
        self.to = {}

        self.level = 0
        self.new_level = 0

        self.signalled = False

    def clear(self):
        if self.signalled:
            char = chr(self.new_level)
            sys.stdout.write(char)

        self.signalled = False
        self.level = self.new_level
        self.new_level = 0

    def signal(self, val):
        self.signalled = True
        self.new_level += val

    def tick(self):
        return {}

    def __repr__(self):
        return '<Stdout special node>'


class Stderr(Stdout):

    def __init__(self):
        self.id = -2
        self.threshold = 0
        self.to = {}

        self.level = 0
        self.new_level = 0

        self.signalled = False

    def clear(self):
        if self.signalled:
            char = chr(self.new_level)
            sys.stderr.write(char)

        self.signalled = False
        self.level = self.new_level
        self.new_level = 0

    def __repr__(self):
        return '<Stderr special node>'


class Exit(Node):

    def __init__(self):
        self.id = -3
        self.threshold = 1
        self.to = {}
        self.level = 0
        self.new_level = 0

    def tick(self):
        if self.level >= self.threshold:
            sys.exit(0)

        return {}

    def __repr__(self):
        return '<Exit special node>'


class Network(object):

    def __init__(self, source):
        self.nodes = []

        for i, line in enumerate(source):
            start = START.match(line).groups()
            threshold = decode(start[0])
            pairs = PAIRS.findall(start[1])

            to = {}
            for target, signal in pairs:
                to[int(target)] = decode(signal)

            self.nodes.append(Node(i, threshold, to))

        self.nodes.append(Stdout())
        self.nodes.append(Stderr())
        self.nodes.append(Exit())

    def play(self):
        while True:
            for node in self.nodes:
                to = node.tick()

                in_buf = None
                for target, val in to.items():
                    if val == 'in':
                        if in_buf is None:
                            # Get new char from input when '-' is encountered
                            # for the first time
                            try:
                                in_buf = val = ord(sys.stdin.read(1))
                            except TypeError:
                                # Value to send set to -1 on EOF
                                in_buf = val = -1

                        else:
                            # Get buffered char (do not retrieve any new char)
                            val = in_buf
                    elif val == 'level':
                        val = node.level

                    self.nodes[target].signal(val)

            for node in self.nodes:
                node.clear()


def decode(cs):
    val = 0

    if cs == '-':
        return 'in'
    elif cs == '+':
        return 'level'
    else:
        for c in cs:
            val = 4 * val + QUADS[c]

        return val


def main(argv):
    source = ''

    if len(argv) < 2:
        source = ''.join(sys.stdin.readlines()).split('/')
    else:
        source = ''.join(open(argv[1]).readlines()).split('/')

    network = Network(source)
    network.play()


if __name__ == '__main__':
    main(sys.argv)
