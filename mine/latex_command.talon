mode: command
code.language: tex
-
flow network:
	insert('\\fnet')
reformat:
	user.vim_set_normal_mode_np()
	key(f7)
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
	insert('\section{}')
	key(left)
subsection:
	insert('\subsection{}')
	key(left)

circulation:
	'\\circulation'
total flow:
	'\\flowtot()'
	key(left)
