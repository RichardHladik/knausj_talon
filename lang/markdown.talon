mode: command
and tag: user.markdown

mode: command
and code.language: markdown
-

code block:
    insert("```\n\n")
    insert("```\n")
    key(up:2)
state task: "- [ ] "
paste as code: 
    insert("{}")
    insert("```\n\n")
    insert("```\n")
    key(up:2)
    edit.paste()

link clip:
    user.insert_cursor_paste("[[|]](", ")")

# XXX - turn the word under the cursor into a link
# link this:

