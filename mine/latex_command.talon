mode: command
code.language: tex
-
symbol <user.latex_casual_math>of:
	insert("{latex_casual_math}()")
	key(left)

section:
	insert('\\section{}')
	key(left)
subsection:
	insert('\\subsection{}')
	key(left)
reference:
	insert('\\ref{}')
	key(left)

# from inline math:
carry on:
	user.vim_normal_mode_np("hf$la")
	user.switch_mode("dictation")


fraction:
	insert('\\frac{{}}{{}}')
	key(left:3)
cop sum: "\\sum"
cop size of:
	insert("||")
	key(left)
cop norm of:
	insert("\\|\\|")
	key(left:2)
cop ell one norm of:
	insert("\\|\\|_1")
	key(left:4)
cop ell two norm of:
	insert("\\|\\|_2")
	key(left:4)
cop ell infinity norm of:
	insert("\\|\\|_\\infty")
	key(left:4)
cop for all: "\\forall "
cop set minus: " \\setminus "
[cop] union: " \\cup "
math left: "\\left"
math right: "\\right"
[cop] cartesian [product]: " \\times "
[cop] subset equal: " \\subseteq "
[cop] conformal: " \\conformal "

empty set:
	insert("\\{{\\}}")
	key(left:2)
empty set builder:
	insert("\\{{\\,\\mid \\,\\}}")
	key(left:9)

label equation:
	'\\label{}'
	key(left)
	'eq:'
lower dots:
	insert("\\ldots ")
centered dots:
	insert("\\cdots ")

math text:
	insert("\\text{}")
	key(left)
math tag:
	insert("\\tag{}")
	key(left)


# obsolete:
(emphasize|emphasized) selected:
	insert("x")
	user.vim_insert_mode("\\emph{}")
	key(left)
    user.vim_normal_mode("P")
	key(right)
