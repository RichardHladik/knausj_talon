mode: command
and user.markdown: user.markdown

mode: command
and code.language: markdown
-

code block:
    insert("```\n\n")
    insert("```\n")
    key(up:2)
state task: "- [ ] "

link clip:
    user.insert_cursor_paste("[[|]](", ")")

# XXX - turn the word under the cursor into a link
# link this:

