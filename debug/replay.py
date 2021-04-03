import os
import pathlib
import shutil
import subprocess
from typing import List

from talon import Module, actions, app, clip, imgui, settings, ui
from talon_init import TALON_HOME

mod = Module()
mod.mode("replay_picker_open")

saved_recording_directory = pathlib.Path(
    f"{pathlib.Path.home()}/talon/documents/conformer_problem_recordings/"
)


class _RecordingReplayer(object):
    """Manages recent recordings and make them available for replay"""

    def __init__(self, count=30):
        """Specify the number of default recording to list in the picker"""
        self.gui_open = False
        self.recordings_list = []
        self.count = count
        self.recordings = pathlib.Path(TALON_HOME, "recordings/")
        self.last_saved_recording = None
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
        last_recordings = self.last_recordings()
        last = last_recordings[-1:][0]
        self.play_file(last)

    def play_last_saved(self):
        """Play the last saved recording """
        if self.last_saved_recording is not None:
            self.play_file(self.last_saved_recording)

    def play_file(self, recording: pathlib.Path):
        """Play the recording file passed in. """
        actions.speech.disable()
        # TODO - make this a python command
        subprocess.run(["mplayer", recording])
        actions.speech.enable()


main_screen = ui.main_screen()


rr = _RecordingReplayer()


def close_replay_picker():
    global rr
    rr.gui_open = False
    gui.hide()
    actions.mode.disable("user.replay_picker_open")


@imgui.open(y=0, x=main_screen.width / 2.6)
def gui(gui: imgui.GUI):
    gui.line()
    gui.text("Commands:")
    gui.text("replay <number>")
    gui.text("replay save <number>")
    gui.text("replay yank <number>")
    gui.line()
    index = 1
    global rr
    # we do this because this code is called in a refresh loop
    if not rr.gui_open:
        rr.gui_open = True
        rr.recordings_list = rr.last_recordings()

    for path in rr.recordings_list:
        gui.text(f"{index}: {path.name} ")
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
        # XXX - make this system generic and configurable
        os.system("playerctl pause")
        raise_replay_picker()

    def replay_picker_hide():
        """Hides the replay_picker display"""
        close_replay_picker()

    def replay_pick(choice: int):
        """Hides the replay_picker display"""
        global rr

        rr.play_file(rr.recordings_list[choice - 1])

    def replay_save(choice: int):
        """Save the selected recording to a preconfigured directory"""
        global rr

        file_name = rr.recordings_list[choice - 1]
        print(f"{file_name}")
        shutil.copy(file_name, saved_recording_directory)
        pathlib.Path(file_name)
        rr.last_saved_recording = file_name
        clip.set_text(file_name.name)

    def replay_save_last():
        """Save the last recording to a preconfigured directory"""
        global rr
        file_name = rr.recordings_list[-1]
        shutil.copy(file_name, saved_recording_directory)
        pathlib.Path(file_name)
        clip.set_text(file_name.name)

    def replay_copy_name(choice: int):
        """Copy the file name of the selected replay file"""
        global rr

        file_name = rr.recordings_list[choice - 1]
        pathlib.Path(file_name)
        clip.set_text(file_name.name)

    def replay_last_recording():
        """Insert some info from the last self.count recordings"""
        global rr
        rr.play_last()

    def replay_last_saved():
        """Insert some info from the last self.count recordings"""
        global rr
        rr.play_last_saved()
