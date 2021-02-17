from keystone import *
import struct
import sys

arch = KS_ARCH_X86
mode = KS_MODE_64
ks = Ks(arch, mode)

memory_top = 0x900000
memory_size = 100000
entry_point = 0x500078

def asm(code):
    c, _ = ks.asm(code)
    return bytes(''.join([chr(x) for x in c]), encoding="utf-8")

def p8(x):
    return struct.pack("<B", x)

def p16(x):
    return struct.pack("<H", x)

def p32(x):
    return struct.pack("<L", x)

def p64(x):
    return struct.pack("<Q", x)

def gen_header(code):
    elfh = b''
    elfh += b'\x7fELF' # magic
    elfh += p8(2) # Class: 2 is 64bit
    elfh += p8(1) # Endinan: little endian
    elfh += p8(1) # ELF Version: EV Current
    elfh += p8(0) # EI_OSABI: It is often set to 0 regardless of the target platform.(Wikipedia)
    elfh += p8(0) # ABI version: (not used)
    elfh += p8(0) * 7 # Padding: currently unused
    elfh += p16(2) # e_type: 2 is exectable file
    elfh += p16(0x3e) # e_machine: 0x3e is x86-64
    elfh += p32(1) # e_version: original version(maybe whatever)
    elfh += p64(entry_point) # e_entry: entry point
    elfh += p64(0x40) # e_phoff: program header table offset -> 64bit is 0x40
    elfh += p64(0) # e_shoff: section header table offset -> notable
    elfh += p32(0) # e_flags: maybe whatever
    elfh += p16(0x40) # e_ehsize: ELF Header Size
    elfh += p16(0x38)  # e_phentsize
    elfh += p16(1) # e_phnum: the number of program header entries
    elfh += p16(0) # e_shentsize: no section headers
    elfh += p16(0) # e_shnum: no section headers
    elfh += p16(0) # e_shstrndx: no section headers

    # Program Header
    prmh = b''
    prmh += p32(1) # p_type: type of segment
    prmh += p32(5) # p_flags: memory segment permission. 0b101 -> Exec + Read
    prmh += p64(0x40 + 0x38) # p_offset: offset of the segment
    prmh += p64(entry_point) # p_vaddr: virtual address to be mapped in memory
    prmh += p64(entry_point) # p_paddr: physical address to be mapped in memory (maybe not used in my machine)
    prmh += p64(len(code)) # p_filesz: file size of this segment
    prmh += p64(len(code)) # p_memsz: file size of this segment
    prmh += p64(0x1000) # p_align: alignment

    return elfh + prmh

def inc_ptr():
    code = asm('inc rbx')
    return code

def dec_ptr():
    code = asm('dec rbx')
    return code

def inc_val():
    code = asm('mov al, [rbx]')
    code += asm('inc al')
    code += asm('mov [rbx], al')
    return code

def dec_val():
    code = asm('mov al, [rbx]')
    code += asm('dec al')
    code += asm('mov [rbx], al')
    return code

def put_char():
    code = asm('mov rax, 1')
    code += asm('mov rdi, 1')
    code += asm('mov rsi, rbx')
    code += asm('mov rdx, 1')
    code += asm('syscall')
    return code

def get_char():
    code = asm('mov rax, 0')
    code += asm('mov rdi, 0')
    code += asm('mov rsi, rbx')
    code += asm('mov rdx, 1')
    code += asm('syscall')
    # kcz: if read syscall returns zero, write \xff (EOF)
    code += asm('dec al')
    code += asm('or byte ptr [rbx], al')
    return code

def push_fun(addr):
    code = asm('mov al, [rbx]')
    code += asm('cmp al, 0')
    code += asm('je %d' % addr)
    return code

def pop_fun(addr):
    code = asm('mov al, [rbx]')
    code += asm('cmp al, 0')
    code += asm('jne %d' % (addr - len(code)))
    return code

def epilogue():
    code = b''
    code += asm('mov rax, 60')
    code += asm('mov rdi, 0')
    code += asm('syscall')
    return code

def prologue():
    code = b''

    # create the area of 'memory'
    code += asm('mov rax, 9') # mmap
    code += asm('mov rdi, %d' % memory_top)
    code += asm('mov rsi, %d' % memory_size) # size
    code += asm('mov rdx, 7')
    code += asm('mov r10, 34')
    code += asm('mov r8, 0xffffffffff')
    code += asm('mov r9, 0')
    code += asm('syscall')

    # use rbx as current memory addr
    # kcz: use the center of the memory
    code += asm('mov rbx, %d' % (memory_top + memory_size/2))

    return code

class InvalidSyntax(Exception):
    pass

def inner(base, root=False):
    code = b''

    while True:
        c = sys.stdin.read(1)
        if not c:
            break

        if c == '>':
            code += inc_ptr()
        elif c == '<':
            code += dec_ptr()
        elif c == '+':
            code += inc_val()
        elif c == '-':
            code += dec_val()
        elif c == '.':
            code += put_char()
        elif c == ',':
            code += get_char()
        elif c == '[':
            code += inner(base + len(code))
        elif c == ']':
            if len(code) > 129:
                tmp = push_fun(130)
            else:
                tmp = push_fun(129)
            code += pop_fun(-len(code))
            return push_fun(len(code)) + code
    if root:
        return code

    raise InvalidSyntax

def main():
    base = entry_point

    code = prologue()
    code += inner(base + len(code), root=True)
    code += epilogue()

    h = gen_header(code)
    artifact = h + code
    return artifact

open('bf', 'wb').write(main())
