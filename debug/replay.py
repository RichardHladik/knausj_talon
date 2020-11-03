import glob
import os
import pathlib
import subprocess
import sys
from typing import List, Set

from talon import Context, Module, actions, app, fs, imgui, settings, ui
from talon_init import TALON_HOME

mod = Module()
mod.mode("replay_picker_open")


class _RecordingReplayer(object):
    """A class that manages finding the most recent recordings, in making them available for replay"""

    def __init__(self, count=10):
        """Specify the number of default recording to list in the picker"""
        self.count = count
        self.recordings = pathlib.Path(TALON_HOME, "recordings/")
        if settings.get("speech.record_all") != 1:
            app.notify("Recording appears to be disabled")

    def last_recordings(self) -> List:
        """Checks the last number of recordings from the recording directory,
        :returns: a list of the most recent self.count recordings
        :rtype: List

        """
        list_of_files = sorted(self.recordings.iterdir(), key=os.path.getmtime)

        file_count = len(list_of_files)
        if file_count < self.count:
            return list_of_files
        else:
            return list_of_files[file_count - self.count : file_count]

    def play_last(self):
        """Play the last recording (before the replay command itself) """
        # actions.speech.disable()
        last_recordings = self.last_recordings()
        last = last_recordings[-1:][0]
        self.play_file(last)

    def play_file(self, recording: pathlib.Path):
        """Play the recording file passed in. """
        actions.speech.disable()
        # TODO - make this a python command
        os.system(f'mplayer "{recording}"')
        actions.speech.enable()


main_screen = ui.main_screen()

recordings_list = []


def close_replay_picker():
    global recordings_list
    recordings_list = []
    gui.hide()
    actions.mode.disable("user.replay_picker_open")


@imgui.open(y=0, x=main_screen.width / 2.6, software=False)
def gui(gui: imgui.GUI):
    replayer = _RecordingReplayer(10)
    gui.text("Select a recording")
    gui.line()
    index = 1
    global recordings_list
    recordings_list = []
    recordings_list.extend(replayer.last_recordings())
    for path in recordings_list:
        gui.text("Pick {}: {} ".format(index, path.name))
        index = index + 1

    if gui.button("Hide"):
        close_replay_picker()


def raise_replay_picker():
    actions.mode.enable("user.replay_picker_open")
    gui.freeze()


@mod.action_class
class Actions:
    def replay_recording_choose():
        """Opens an UI for picking a recording to replay """
        raise_replay_picker()

    def replay_picker_hide():
        """Hides the replay_picker display"""
        close_replay_picker()

    def replay_pick(choice: int):
        """Hides the replay_picker display"""
        global recordings_list
        rr = _RecordingReplayer()
        rr.play_file(recordings_list[choice])

    def replay_last_recording():
        """Insert some info from the last self.count recordings"""
        rr = _RecordingReplayer(10)
        rr.play_last()
