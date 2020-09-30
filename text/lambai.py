# XXX - the sleeps our way too short when in vmware

import os
import subprocess
import time

from hexdump import hexdump
from talon import Context, Module, actions, clip, settings, ui

try:
    import pynvim

    has_pynvim = True
except Exception:
    has_pynvim = False
    print("WARNING: lambai requires pynvim python module")

mod = Module()
lambai = None


class Lambai:
    def __init__(self):
        """Sets up an headless nvim instance"""

        # XXX - need to fix the path for non linux I
        # self.nvim = pynvim.attach(
        #     "child", argv=["/bin/env", "nvim", "--embed", "--headless"]
        # )
        nvim_socket_path = "/tmp/nvim2"
        # subprocess.Popen(["nvim", "--headless", "--listen", nvim_socket_path])
        self.nvim = pynvim.attach("socket", path=nvim_socket_path)
        self.cursor_pos = 0
        self.orig_cursor_pos = 0
        self.orig_cursor_end_pos = 0

    def grab_text(self):
        """Grabs all text from the current input field."""
        actions.key("ctrl-a")
        actions.key("ctrl-c")
        time.sleep(0.1)
        text = clip.text()
        #        print(type(text))
        #        hexdump(text.encode("utf-8"))
        #        print(text)
        self.nvim.current.buffer[0] = text
        self.orig_cursor_end_pos = len(text)

    def init_cursor_index(self):
        actions.key("shift-home")
        time.sleep(0.1)
        actions.key("ctrl-c")
        time.sleep(0.1)
        text = clip.text()
        print(text)
        actions.key("home")
        for i in range(1, len(text)):
            actions.key("right")
        self.cursor_pos = len(text)
        self.orig_cursor_pos = self.cursor_pos

        # now populate vim buffer set the cursor at the right spot
        self.grab_text()
        self.nvim.current.window.cursor = [1, self.cursor_pos]

    def restore_cursor_position(self, pos):
        if self.orig_cursor_end_pos - pos < pos:
            count = self.orig_cursor_end_pos - pos
            direction = "left"
            actions.key("end")

        else:
            count = pos
            direction = "right"
            actions.key("home")
        print(count)
        print(direction)
        # XXX might speed up with word jumping
        for i in range(0, count):
            actions.key(direction)

    def skip_until(self, key: str):
        self.init_cursor_index()
        self.nvim.command(f"normal t{key}")
        print(self.nvim.current.window.cursor)
        new_pos = self.nvim.current.window.cursor[1]
        # XXX - this adjustment should be automatic in a method
        self.restore_cursor_position(new_pos + 1)


def init_lambai():
    global lambai
    if lambai is None:
        lambai = Lambai()
    return lambai


@mod.action_class
class Actions:
    def lambai_find_cursor():
        """Hides the homophones display"""
        lambai.find_cursor_orientation()

    def lambai_skip_until(key: str):
        """moves the cursor one word to the left"""
        lambai = init_lambai()
        lambai.skip_until(key)
