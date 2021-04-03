mode: user.python
mode: command
and code.language: python
-

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
