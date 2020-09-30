tag: user.grid
-
cell <number>:
    user.grid_narrow(number)

grid off:
    user.grid_close()

grid reset:
    user.grid_reset()

grid back:
    user.grid_go_back()

grid click:
    mouse_click(0)
    user.grid_close()
