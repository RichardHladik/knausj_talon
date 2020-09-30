# Python code largely stolen from https://github.com/fidgetingbits/knausj_talon
from talon import Context, Module, actions

mod = Module()
ctx = Context()

ctx.lists["self.c_pointers"] = {
    "pointer": "*",
    "pointer to pointer": "**",
}

ctx.lists["self.c_visibilities"] = {
    "private": "private",
    "protected": "protected",
    "static": "static",
    "public": "public",
}

ctx.lists["self.c_signed"] = {
    "signed": "signed",
    "unsigned": "unsigned",
}

ctx.lists["self.c_types"] = {
    "character": "char",
    "short": "short",
    "long": "long",
    "integer": "int",
    "void": "void",
    "double": "double",
    "struct": "struct",
    "struck": "struct",
    "num": "enum",
    "union": "union",
    "float": "float",
    "size tee": "size_t",
    "size type": "size_t",
}

ctx.lists["self.c_templates"] = {
    "vector": "std::vector",
}

ctx.lists["self.c_libraries"] = {
    "assert": "assert.h",
    "type": "ctype.h",
    "error": "errno.h",
    "float": "float.h",
    "limits": "limits.h",
    "locale": "locale.h",
    "math": "math.h",
    "set jump": "setjmp.h",
    "signal": "signal.h",
    "arguments": "stdarg.h",
    "definition": "stddef.h",
    "input": "stdio.h",
    "output": "stdio.h",
    "library": "stdlib.h",
    "string": "string.h",
    "time": "time.h",
}

mod.list("c_templates", desc="Common C templated types")
mod.list("c_visibilities", desc="Common C visibilities")
mod.list("c_pointers", desc="Common C pointers")
mod.list("c_signed", desc="Common C datatype signed modifiers")
mod.list("c_types", desc="Common C types")
mod.list("c_libraries", desc="Standard C library")


@mod.capture
def cast(m) -> str:
    "Returns a string"


@mod.capture
def c_pointers(m) -> str:
    "Returns a string"


@mod.capture
def c_signed(m) -> str:
    "Returns a string"

@mod.capture
def c_visibilities(m) -> str:
    "Returns a string"

@mod.capture
def c_templates(m) -> str:
    "Returns a string"

@mod.capture
def c_types(m) -> str:
    "Returns a string"

@mod.capture
def raw_variable(m) -> str:
    "Returns a string"
@mod.capture
def variable(m) -> str:
    "Returns a string"

@mod.capture
def function(m) -> str:
    "Returns a string"

@mod.capture
def library(m) -> str:
    "Returns a string"

@ctx.capture(rule="{self.c_pointers}")
def c_pointers(m) -> str:
    return m.c_pointers


@ctx.capture(rule="{self.c_signed}")
def c_signed(m) -> str:
    return m.c_signed

@ctx.capture(rule="{self.c_visibilities}")
def c_visibilities(m) -> str:
    return m.c_visibilities

@ctx.capture(rule="{self.c_templates}")
def c_templates(m) -> str:
    return m.c_templates

@ctx.capture(rule="{self.c_types}")
def c_types(m) -> str:
    return m.c_types

@ctx.capture(rule="{self.c_libraries}")
def library(m) -> str:
    return m.c_libraries


@ctx.capture(rule="[<self.c_signed>] <self.c_types> [<self.c_pointers>+]")
def cast(m) -> str:
    return "(" + " ".join(list(m)) + ")"

@ctx.capture(rule="[<self.c_signed>] <self.c_types> [<self.c_pointers>]")
def raw_variable(m) -> str:
    return " ".join(list(m))

@ctx.capture(rule="<self.raw_variable> | <self.c_templates> of <self.raw_variable>")
def variable(m) -> str:
    m = list(m)
    if len(m) == 1:
        ret = m[0]
    else:
        ret = "{0}<{1}>".format(m[0], m[2])
    if ret[-1] != "*":
        ret = ret + " "
    return ret

@ctx.capture(rule="[<self.c_signed>] <self.c_types> [<self.c_pointers>]")
def function(m) -> str:
    ret = " ".join(list(m))
    if ret[-1].isalpha():
        ret = ret + " "
    return ret
