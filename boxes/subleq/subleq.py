#!/usr/bin/env python3

# based on https://esolangs.org/wiki/Subleq/subleq.py
# modified to
# - allow relative jump
#     syntax '?+N' or '?-N' is translated to N*3 relative to the current instruction's address
# - handle input
#     when a is -1, its value is the input character's ASCII code

import sys

class Subleq:
    def __init__(self):
        self.mem = []

    def assemble(self, source_text):
        labels = self.collect_labels(source_text)
        self.write_contents(source_text, labels)

    def collect_labels(self, source_text):
        labels = {}
        def label_it(s, addr):
            if ':' in s:
                label, contents = s.split(':')
                labels[label] = addr

        addr = 0
        for line in source_text.split("\n"):
            line = line.strip()
            if not line or line.startswith('#'):
                continue
            [a, b, c] = line.split()
            label_it(a, addr)
            label_it(b, addr + 1)
            label_it(c, addr + 2)
            addr += 3

        return labels

    def write_contents(self, source_text, labels):
        def write_it(v, addr):
            if ':' in v:
                label, contents = v.split(':')
                v = contents
            if v in labels:
                v = labels[v]
            # modifyed to allow jump to relative address
            # if v == '?+1':
            #     v = addr + 3
            if isinstance(v, str) and v.startswith(('?+','?-')):
                jump_offset = int(v[1:])
                v = addr + 3 * jump_offset
            # end of modification
            self.mem.append(int(v))

        addr = 0
        for line in source_text.split("\n"):
            line = line.strip()
            if not line or line.startswith('#'):
                continue
            [a, b, c] = line.split()
            write_it(a, addr)
            write_it(b, addr)
            write_it(c, addr)
            addr += 3

    def dump_triples(self, f):
        addr = 0
        while addr < len(self.mem):
            a = self.mem[addr]
            b = self.mem[addr + 1] if addr + 1 < len(self.mem) else 0
            c = self.mem[addr + 2] if addr + 2 < len(self.mem) else 0
            f.write('{} {} {}\n'.format(a, b, c))
            addr += 3

    def load_triples(self, f):
        for line in f:
            a, b, c = line.split()
            self.mem.append(int(a))
            self.mem.append(int(b))
            self.mem.append(int(c))

    def run(self, trace=False):
        pc = 0
        while pc >= 0:
            a = self.mem[pc]
            b = self.mem[pc + 1]
            c = self.mem[pc + 2]
            if trace:
                print('pc={}, a={}, b={}, c={}'.format(pc, a, b, c))
            # modified to handle input
            # when a is -1, its value is the input character's ASCII code
            # at_a = self.mem[a]
            at_a = 0
            if a>= 0:
              at_a = self.mem[a]
            elif a == -1:
              input_char = sys.stdin.read(1)
              at_a = ord(input_char) if input_char else -1
            # end of modification
            if b >= 0:
                at_b = self.mem[b]
                result = at_b - at_a
                self.mem[b] = result
            elif b == -1:
                sys.stdout.write(chr(at_a))
                result = 0
            if result <= 0:
                pc = c
            else:
                pc += 3


def main(args):
    if len(args) == 3 and args[0] == 'assemble':
        subleq = Subleq()
        subleq.assemble(open(args[1], 'r').read())
        with open(args[2], 'w') as f:
            subleq.dump_triples(f)
    elif len(args) == 2 and args[0] == 'run':
        subleq = Subleq()
        with open(args[1], 'r') as f:
            subleq.load_triples(f)
        subleq.run()
    elif len(args) == 2 and args[0] == 'trace':
        subleq = Subleq()
        with open(args[1], 'r') as f:
            subleq.load_triples(f)
        subleq.run(trace=True)
    else:
        print('usage: subleq.py assemble in.subleqasm out.triples | run in.triples | trace in.triples')
        sys.exit(1)


if __name__ == '__main__':
    main(sys.argv[1:])
