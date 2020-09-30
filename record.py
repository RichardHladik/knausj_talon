import datetime
import os
import struct
import wave
from glob import glob

from talon import Context, Module, actions, speech_system
from talon.lib import flac
from talon_init import TALON_HOME

ALWAYS_RECORD = True
OUTPUT_DIR = TALON_HOME / "recordings"

os.makedirs(OUTPUT_DIR, exist_ok=True)

current_phrase = None


def pre_phrase(d):
    global current_phrase
    current_phrase = d


def post_phrase(d):
    if ALWAYS_RECORD:
        phrase = " ".join(getattr(d["parsed"], "_unmapped", d["phrase"]))
        actions.self.record_flac(phrase)


speech_system.register("pre:phrase", pre_phrase)
speech_system.register("post:phrase", post_phrase)

mod = Module()


def find_existing_files(name):
    """Yield directory names not starting with '.' under given path."""
    entries = []
    for entry in os.scandir(OUTPUT_DIR):
        if entry.name.startswith(f"{name}-"):
            entries.append(entry.name)
    return entries


def datetime_now():
    """the date right now is an integer"""
    return datetime.datetime.now().strftime("%Y%m%d%H%M%S%f")


@mod.action_class
class Actions:
    def record_flac(words: str):
        """Record the phrase audio to a flac file"""
        words = words.strip()
        if not current_phrase or not current_phrase.get("samples") or not words:
            return
        path = OUTPUT_DIR / f"{words}-{datetime_now()}.flac"

        flac.write_flac(str(path), current_phrase["samples"], compression_level=1)
        print(f"RECORDED: {path}")

    def record_wav(words: str):
        """Record the phrase audio to a wave file"""
        samples = current_phrase["samples"]
        scaled = (min(32767, max(-32768, int(s * 32768))) for s in samples)
        binary = struct.pack("<{}h".format(len(samples)), *scaled)
        path = OUTPUT_DIR / f"{words}-{datetime_now()}.wav"
        with wave.open(str(path), "wb") as w:
            w.setnchannels(1)
            w.setsampwidth(2)
            w.setframerate(16000)
            w.writeframes(binary)
        print(f"RECORDED: {path}")


@mod.action
def replay_wav(path: str):
    """Replay a wave file into the speech engine"""
    if not os.path.isabs(path) and not os.sep in path:
        path = OUTPUT_DIR / path
    with wave.open(str(path), "rb") as w:
        frames = w.readframes(w.getnframes())
    samples = struct.unpack("<{}h".format(len(frames) // 2), frames)
    speech_system.engine.engine._on_audio_frame(samples, pad=False)
