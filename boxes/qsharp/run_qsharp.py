import sys
import os
import shutil
import tempfile
import re

import qsharp

src_file = os.path.realpath(sys.argv[1])
tmp_dir = tempfile.mkdtemp()

try:
    src_dir = os.path.join(tmp_dir, 'src')
    os.makedirs(src_dir)
    shutil.copy(src_file, os.path.join(src_dir, 'main.qs'))
    with open(os.path.join(tmp_dir, 'qsharp.json'), 'w') as f:
        f.write('{}')

    with open(src_file) as f:
        source = f.read()

    ns_match = re.search(r'namespace\s+([\w.]+)', source)
    ns = ns_match.group(1) if ns_match else None

    # Find @EntryPoint operation (no-param entry point)
    ep_match = re.search(r'@EntryPoint\(\)\s+operation\s+(\w+)\s*\(\s*\)', source)
    # Find any operation with a single String parameter (for stdin-based programs)
    param_match = re.search(r'operation\s+(\w+)\s*\(\s*(\w+)\s*:\s*String\s*\)', source)

    if ep_match:
        entry_point = ep_match.group(1)
        entry_expr = f'{ns}.{entry_point}()' if ns else f'{entry_point}()'
    elif param_match:
        entry_point = param_match.group(1)
        stdin_data = sys.stdin.read().rstrip('\n')
        stdin_escaped = stdin_data.replace('\\', '\\\\').replace('"', '\\"')
        entry_expr = f'{ns}.{entry_point}("{stdin_escaped}")' if ns else f'{entry_point}("{stdin_escaped}")'
    else:
        entry_expr = f'{ns}.Main()' if ns else 'Main()'

    qsharp.init(project_root=tmp_dir)
    qsharp.run(entry_expr, shots=1)
finally:
    shutil.rmtree(tmp_dir, ignore_errors=True)
