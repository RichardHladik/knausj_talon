import sys
from typing import Set

from talon import Context, Module, actions

# My experience:
#   fine - conflicts with find
#   jury  - suddenly always matching with three or tree
#   pit  - conflicts with page
#   yank - conflicts with vim command
default_alphabet = "air bat cap drum each fin gust harp wiggle jury crunch look made near oak pit quench red sun trap urge vest whale plex yes zip".split(
    " "
)
letters_string = "abcdefghijklmnopqrstuvwxyz"

default_digits = "zero one two three four five six seven eight nine".split(" ")
numbers = [str(i) for i in range(10)]
default_f_digits = (
    "one two three four five six seven eight nine ten eleven twelve".split(" ")
)

mod = Module()
mod.list("letter", desc="The spoken phonetic alphabet")
mod.list("symbol", desc="All symbols from the keyboard")
mod.list("arrow", desc="All arrow keys")
mod.list("number", desc="All number keys")
mod.list("modifier", desc="All modifier keys")
mod.list("function", desc="All function keys")
mod.list("special", desc="All special keys")


@mod.capture
def modifiers(m) -> str:
    "One or more modifier keys"


@mod.capture
def arrow(m) -> str:
    "One directional arrow key"


@mod.capture
def arrows(m) -> str:
    "One or more arrows separate by a space"


@mod.capture
def number(m) -> str:
    "One number key"


@mod.capture
def letter(m) -> str:
    "One letter key"


@mod.capture
def letters(m) -> list:
    "Multiple letter keys"


@mod.capture
def symbol(m) -> str:
    "One symbol key"


@mod.capture
def function(m) -> str:
    "One function key"


@mod.capture
def special(m) -> str:
    "One special key"


@mod.capture
def any(m) -> str:
    "Any one key"


@mod.capture
def key(m) -> str:
    "A single key with optional modifiers"


ctx = Context()
ctx.lists["self.modifier"] = {
    "control": "ctrl",  #'troll':   'ctrl',
    "option": "alt",
    "shift": "shift",  #'sky':     'shift',
    "super": "super",
}
alphabet = dict(zip(default_alphabet, letters_string))
ctx.lists["self.letter"] = alphabet
ctx.lists["self.symbol"] = {
    "grave": "`",
    "comma": ",",
    "dot": ".",
    "point": ".",
    "space": " ",
    "void": " ",
    "semi": ";",
    "tick": "'",
    "lock": "[",
    "square": "[",
    "rock": "]",
    "slash": "/",
    "bish": "\\",
    # "backslash": "\\",
    "minus": "-",
    "dash": "-",
    "negative": "-",
    "equals": "=",
    "plus": "+",
    "question": "?",
    "tilde": "~",
    "bang": "!",
    "dollar": "$",
    "under score": "_",
    "score": "_",
    "colon": ":",
    "coal": ":",
    "lub": "(",
    "paren": "(",
    "rub": ")",
    "lace": "{",
    "race": "}",
    "angle": "<",
    "langle": "<",
    "rangle": ">",
    "star": "*",
    "hash": "#",
    "percent": "%",
    "cent": "%",
    "caret": "^",
    "at sign": "@",
    "amper": "&",
    "pipe": "|",
    "quote": '"',
}


ctx.lists["self.number"] = dict(zip(default_digits, numbers))
ctx.lists["self.arrow"] = {
    "down": "down",
    "left": "left",
    "right": "right",
    "up": "up",
}


simple_keys = [
    "end",
    "enter",
    "escape",
    "home",
    "insert",
    "pagedown",
    "pageup",
    "space",
    "tab",
]

alternate_keys = {
    "backspace": "backspace",
    "forward delete": "delete",
    "toast": "tab",
    "junk": "backspace",
    "nuke": "delete",
}
keys = {k: k for k in simple_keys}
keys.update(alternate_keys)
ctx.lists["self.special"] = keys
ctx.lists["self.function"] = {
    f"F {default_f_digits[i]}": f"f{i + 1}" for i in range(12)
}


@ctx.capture(rule="{self.modifier}+")
def modifiers(m):
    return "-".join(m.modifier_list)


@ctx.capture(rule="{self.arrow}")
def arrow(m) -> str:
    return m.arrow


@ctx.capture(rule="<self.arrow>+")
def arrows(m) -> str:
    return str(m)


@ctx.capture(rule="{self.number}")
def number(m):
    return m.number


@ctx.capture(rule="{self.letter}")
def letter(m):
    return m.letter


@ctx.capture(rule="{self.special}")
def special(m):
    return m.special


@ctx.capture(rule="{self.symbol}")
def symbol(m):
    return m.symbol


@ctx.capture(rule="{self.function}")
def function(m):
    return m.function


@ctx.capture(
    rule="(<self.arrow> | <self.number> | <self.letter> | <self.symbol> | <self.function> | <self.special>)"
)
def any(m) -> str:
    return str(m)


@ctx.capture(rule="<self.modifiers> <self.any>")
def key(m) -> str:
    mods = m.modifiers
    return "-".join([mods] + [m.any])


@ctx.capture(rule="{self.letter}+")
def letters(m):
    return m.letter_list


@mod.action_class
class Actions:
    def keys_uppercase_letters(m: list):
        """Inserts uppercase letters from list"""
        actions.insert("".join(m).upper())

    def get_alphabet() -> dict:
        """Provides the alphabet dictionary"""
        return alphabet
