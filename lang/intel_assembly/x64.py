from talon import Context, Module

mod = Module()
mod.list("registers", desc="A list of x64 architecture registers")
ctx = Context()
ctx.matches = r"""
tag: user.x64
"""

registers = {
    # general purpose
    "air": "rax",
    "racks": "rax",
    "bat": "rbx",
    "cap": "rcx",
    "drum": "rdx",
    "source": "rsi",
    "dest": "rdi",
    "stack": "rsp",
    "stack pointer": "rsp",
    "frame": "rbp",
    "frame pointer": "rbp",
    "base": "rbp",
    "base pointer": "rbp",
    "eight": "r8",
    "nine": "r9",
    "ten": "r10",
    "eleven": "r11",
    "twelve": "r12",
    "thirteen": "r13",
    "fourteen": "r14",
    "fifteen": "r15",
    # pointers
    "instruction": "rip",
    "rip": "rip",
    # segment
}
ctx.lists["user.registers"] = registers
