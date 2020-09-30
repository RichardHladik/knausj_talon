tag: user.gdb
-

restart debug session:
    key(ctrl-c)
    insert("quit\n")
    sleep(1)
    insert("y\n")
    insert("!!\n\n")
    sleep(2)
    key(ctrl-c)
    insert("ptchunk -h\n")
    insert("heapls\n")
