os: linux
tag: user.tmux
-
mini: "tmux "

#session management
mini new session:
    insert('tmux new ')
mini sessions:
    key(ctrl-b)
    key(s)
mini name session:
    key(ctrl-b)
    key($)
mini kill session:
    insert('tmux kill-session -t ')
#window management
mini new:
    key(ctrl-b)
    key(c)
mini window <number_small>:
    key(ctrl-b )
    key('{number_small}')
mini prev:
    key(ctrl-b)
    key(p)
mini next:
    key(ctrl-b)
    key(n)
mini rename window:
    key(ctrl-b)
    key(,)
mini close window:
    key(ctrl-b)
    key(&)
#pane management
mini split horizontal:
    key(ctrl-b)
    key(%)
mini split vertical:
    key(ctrl-b)
    key(")
mini next pane:
    key(ctrl-b)
    key(o)
mini move <user.arrow_key>:
    key(ctrl-b)
    key(arrow_key)
mini close pane:
    key(ctrl-b)
    key(x)
#Say a number right after this command, to switch to pane
mini pane numbers:
    key(ctrl-b)
    key(q)
