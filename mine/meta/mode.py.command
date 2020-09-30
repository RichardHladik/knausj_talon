from talon import actions
import os
actions.mimic("command mode".split())
os.unlink(__file__)
