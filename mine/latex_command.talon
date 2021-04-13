mode: command
code.language: tex
-
flow network:
	insert('\\fnet')
commodities:
	insert("\\comm")
full commodities:
	insert("\\commfull")
cite:
	insert('\\cite{}')
	key(left)
cite pit:
	insert('\\citep{}')
	key(left)
section:
	insert('\\section{}')
	key(left)
subsection:
	insert('\\subsection{}')
	key(left)

circulation:
	'\\circulation'
total flow:
	'\\flowtot()'
	key(left)
