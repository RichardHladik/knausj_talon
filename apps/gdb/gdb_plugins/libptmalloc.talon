tag: gdb
-

(p t|pee tea) chunk: "ptchunk "
(p t|pee tea) chunk help: "ptchunk -h\n"
(p t|pee tea) search: "ptsearch "
(p t|pee tea) arena: "ptarena "
(p t|pee tea) bin: "ptbin "
(p t|pee tea) call back: "ptcallback "
(p t|pee tea) arena of: "ptarenaof "
(p t|pee tea) scan chunks: "ptscanchunks "
(p t|pee tea) help: "pthelp\n"

# XXX - eventually these could be replaced with generic heap actions
heck stump <user.number> chunks: "ptchunk -x -c {number} "
search <number> chunks:  "ptchunk -c {number} -s"
