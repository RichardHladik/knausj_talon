from talon import Context, Module

mod = Module()
ctx = Context()
ctx.matches = r"""
tag: user.x86
"""


registers = {
    "air": "eax",
    "bat": "ebx",
    "cap": "ecx",
    "drum": "edx",
    "source": "esi",
    "dest": "edi",
    "stack": "esp",
    "frame": "ebp",
    "instruction": "eip",
}

ctx.lists["user.registers"] = registers
