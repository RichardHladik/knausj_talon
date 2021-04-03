tag: user.libptmalloc
-

tag(): user.heap_analysis
action(user.heap_analysis_chunk): "ptchunk "
action(user.heap_analysis_chunk_verbose): "ptchunk -v"
action(user.heap_analysis_chunk_hexdump): "ptchunk -x"
action(user.heap_analysis_chunk_help): "ptchunk -h\n"
action(user.heap_analysis_search): "ptsearch "
action(user.heap_analysis_arena): "ptarena "
action(user.heap_analysis_bin):  "ptbin "
action(user.heap_analysis_call_back): "ptcallback "
action(user.heap_analysis_arena_of): "ptarenaof "
action(user.heap_analysis_scan): "ptscanchunks "
action(user.heap_analysis_help): "pthelp\n"

# XXX - eventually these could be replaced with generic heap actions
heck stump <number> chunks: "ptchunk -x -c {number} "
search <number> chunks: "ptchunk -c {number} -s"
