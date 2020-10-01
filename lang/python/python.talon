mode: user.python
mode: command
and code.language: python
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic
settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"
action(user.code_operator_indirection): ""
action(user.code_operator_address_of): ""
action(user.code_operator_structure_dereference): ""
action(user.code_operator_lambda): ""
action(user.code_operator_subscript):
    insert("[]")
    key(left)
action(user.code_operator_assignment): " = "
action(user.code_operator_subtraction): " - "
action(user.code_operator_subtraction_assignment): " -= "
action(user.code_operator_addition): " + "
action(user.code_operator_addition_assignment): " += "
action(user.code_operator_multiplication): " * "
action(user.code_operator_multiplication_assignment): " *= "
action(user.code_operator_exponent): " ** "
action(user.code_operator_division): " / "
action(user.code_operator_division_assignment): " /= "
action(user.code_operator_modulo): " % "
action(user.code_operator_modulo_assignment): " %= "
action(user.code_operator_equal): " == "
action(user.code_operator_not_equal): " != "
action(user.code_operator_greater_than): " > "
action(user.code_operator_greater_than_or_equal_to): " >= "
action(user.code_operator_less_than): " < "
action(user.code_operator_less_than_or_equal_to): " <= "
action(user.code_operator_and): " and "
action(user.code_operator_or): " or "
action(user.code_operator_bitwise_and): " & "
action(user.code_operator_bitwise_and_assignment): " &= "
action(user.code_operator_bitwise_or): " | "
action(user.code_operator_bitwise_or_assignment): " |= "
action(user.code_operator_bitwise_exclusive_or): " ^ "
action(user.code_operator_bitwise_exclusive_or_assignment): " ^= "
action(user.code_operator_bitwise_left_shift): " << "
action(user.code_operator_bitwise_left_shift_assignment): " <<= "
action(user.code_operator_bitwise_right_shift): " >> "
action(user.code_operator_bitwise_right_shift_assignment): " >>= "
action(user.code_self): "self"
action(user.code_null): "None"
action(user.code_is_null): " is None"
action(user.code_is_not_null): " is not None"
action(user.code_state_if):
    insert("if :")
    key(left)
action(user.code_state_else_if):
    insert("elif :")
    key(left)
action(user.code_state_else):
    insert("else:")
    key(enter)
action(user.code_state_switch):
    insert("switch ()")
    edit.left()
action(user.code_state_case):
    insert("case \nbreak;")
    edit.up()
action(user.code_state_for): "for "
action(user.code_state_for_each):
    insert("for in ")
    key(left)
    edit.word_left()
    key(space)
    edit.left()
action(user.code_state_while):
    insert("while :")
    edit.left()
action(user.code_type_class): "class "
action(user.code_import): "import "
action(user.code_from_import):
    insert("from import ")
    key(left)
    edit.word_left()
    key(space)
    edit.left()
action(user.code_comment): "# "
action(user.code_state_return):
	insert("return ")
action(user.code_true): "True"
action(user.code_false): "False"




####
# Operators
####
empty dict: "{}"
empty list: "{}"
word (dickt | dictionary): "dict"
state (def | deaf | deft): "def "
class <user.text>:
    insert("class ")
    insert(user.formatted_text(text, "hammer"))
    insert("():\n")
dunder in it: "__init__"
self taught: "self."
for in:
    insert("for in ")
    key(left)
    edit.word_left()
    key(space)
    edit.left()
dock string:
    key(":6)
    edit.left()
    edit.left()
    edit.left()
big dock string:
    key(":3)
    key(enter:2)
    key(":3)
    edit.up()

####
# Keywords
####
return: "return "
none: "None"
true: "True"
false: "False"
pass: "pass"
self: "self"

type {user.python_type_list}:
    insert("{python_type_list}")
field {user.python_docstring_fields}:
    insert("{python_docstring_fields}")
####
# Miscellaneous
# XXX - make these snippets probably
####
define private (method|function) <user.text>:
    insert("def _")
    insert(user.formatted_text(text, "snake"))
    insert("(self):")
    key(left)
    key(left)

define public (method|function) <user.text>:
    insert("def ")
    insert(user.formatted_text(text, "snake"))
    insert("(self):")
    key(left)
    key(left)

define (method|function) <user.text>$:
    insert("def ")
    insert(user.formatted_text(text, "snake"))
    insert("():")
    key(left)
    key(left)

call method <user.text>:
    key(.)
    insert(user.formatted_text(text, "snake"))
    insert("()")
    key(left)

call [function] <user.text>:
    insert(user.formatted_text(text, "snake"))
    insert("()")
    key(left)

# XXX - move to a talon programming helper
capture <user.text>:
    insert("@mod.capture\ndef ")
    insert(user.formatted_text(text, "snake"))
    insert("(m) -> str:\n")
    insert('    "Returns a string"\n\n')
    insert("@ctx.capture(rule='{self.")
    insert(user.formatted_text(text, "snake"))
    insert("}')\ndef ")
    insert(user.formatted_text(text, "snake"))
    insert("(m) -> str:\n")
    insert('    "Returns a string"\n')
pie test: "pytest"
state past: "pass"

^funky <user.text>$: user.code_private_function(text)
#^pro funky <user.text>$: user.code_protected_function(text)
^pub funky <user.text>$: user.code_public_function(text)
#^static funky <user.text>$: user.code_private_static_function(text)
#^pro static funky <user.text>$: user.code_protected_static_function(text)
#^pub static funky <user.text>$: user.code_public_static_function(text)
raise {user.python_exception}: user.insert_cursor("raise {python_exception}([|])")
