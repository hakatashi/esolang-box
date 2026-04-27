#!/usr/bin/env python3
import sys
import os

sys.path.insert(0, '/root')

from CheLang.cheLangCompiler import run
from CheLang.Values import Empty

uri = sys.argv[1]
result, error = run('<chelang>', f'Correme("{uri}")')

if error:
    print(error.as_string(), file=sys.stderr)
    sys.exit(1)
