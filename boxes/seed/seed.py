import sys
import random

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print('Usage: python {} <filename>'.format(sys.argv[0]))
        sys.exit(1)

    program = open(sys.argv[1], 'r').read()

    numbers = program.split()
    length = int(numbers[0])

    random.seed(int(numbers[1]))
    chars = "".join(map(chr, range(32, 127))) + '\n'
    befunge = "".join([chars[int(random.random() * 96)] for i in range(length)])

    print(befunge)
