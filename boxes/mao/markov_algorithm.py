#!/usr/bin/env python3
import argparse
import itertools
import sys
import time
from typing import *


def parse(code: str) -> List[Tuple[str, bool, str]]:
    ops = []
    for line in code.splitlines():
        pre_str = ""
        post_str = ""
        is_terminate = False
        is_pre_str = True
        pre_c = ""
        for c in line:
            added = ""
            if c == ":":
                if pre_c == "\\":
                    added = ":"
                elif pre_c == ":":
                    is_terminate = True
                    is_pre_str = False
                else:
                    is_pre_str = False
            elif c == "\\":
                if pre_c == "\\":
                    added = "\\"
            elif c == "n" and pre_c == "\\":
                added = "\n"
            else:
                added = c
            if is_pre_str:
                pre_str += added
            else:
                post_str += added
            pre_c = c
        ops.append((pre_str, is_terminate, post_str))
    return ops


def apply(ops: List[Tuple[str, bool, str]], data: str) -> Tuple[str, bool]:
    # O(ルール数*文字列長) かかる. 頑張れば消せるが...
    for a, terminate, b in ops:
        if not (a in data):
            continue
        if len(a) == 0 and len(data) == 0:
            return b, terminate
        return data.replace(a, b, 1), terminate
    return data, True


def interpret(code: str, data: str) -> str:
    ops = parse(code)
    for step in itertools.count():
        data, terminate = apply(ops, data)
        if terminate:
            break
    return data


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('file')
    args = parser.parse_args()
    with open(args.file) as f:
        code = f.read()
    with open('/dev/stdin') as f:
        stdin = f.read()
    print(interpret(code, stdin), end="")


if __name__ == '__main__':
    main()
