import os
from typing import List

from talon import Context, Module, actions

mod = Module()
mod.tag("anki_edit", desc="Tag indicates that we are currently editing Anki")

ctx = Context()
ctx.matches = r"""
tag: user.anki_edit
"""

@mod.action_class
class Actions:
    def german_anki_get_text():
        """Returns the text in the current textbox"""
        actions.edit.select_all()
        return actions.edit.selected_text()

    def german_anki_get_word():
        """Returns the word in the current textbox"""
        word = actions.user.german_anki_get_text()
        for pref in ["e ", "r ", "s ", "sich "]:
            if word.startswith(pref):
                word = word[len(pref):]
        return word.strip()

    def german_open_wiktionary(word:str=None):
        """Opens the word in the current textbox in wiktionary"""
        if word is None:
            word = actions.user.german_anki_get_word()
        actions.user.quick_url_current(f"https://de.wiktionary.org/wiki/{word}")
        return word

    def german_wiktionary_yank_audio():
        """Assuming we are on de.wiktionary.org, yanks the first audio."""
        actions.browser.focus_address()
        actions.sleep("100ms")
        actions.key("ctrl-f")
        actions.insert("Hörbeispiele")
        actions.sleep("50ms")
        actions.key("escape tab enter")
        actions.sleep("500ms")
        actions.browser.focus_address()
        actions.sleep("200ms")
        url = actions.edit.selected_text()
        actions.sleep("200ms")
        actions.browser.go_back()
        print(url)
        if not any(a in url for a in "ogg opus mp3".split()):
            url = None
        return url

    def open_forvo(word: str):
        """Opens forvo with the current word, prepares developer tools."""
        actions.user.quick_url_current(f"https://forvo.com/search/{word}")
        actions.sleep("1000ms")
        actions.key("f12")


    def german_pronounce(word:str=None, back:bool=False):
        """Searches and copies the pronunciation from wiktionary"""
        if word is None:
            word = actions.user.german_anki_get_word()
        actions.key("tab")
        actions.edit.select_all()
        for word in word.split("\n"):
            os.system(f"python /mnt/data/p/wiktionary.py '{word}'")
            actions.edit.paste()
        actions.sleep("100ms")
        if back:
            actions.key("shift-tab")
        return word

    def german_get_text(word:str=None):
        """Searches and returns the definition from wiktionary"""
        if word is None:
            word = actions.user.german_anki_get_word()
        return actions.user.system_command_capture(f"python /mnt/data/p/wiktionary-dl.py {word}")

    def german_paste(word:str=None, text:str=None):
        """Searches and copies the definition from wiktionary"""
        if text is None:
            text = actions.user.german_get_text(word)
        actions.key("shift-tab")
        actions.sleep("100ms")
        actions.edit.select_all()
        actions.user.paste(text)
        actions.sleep("50ms")

    def german_both():
        """Searches for both the pronunciation and the definition."""
        word = actions.user.german_pronounce(None, True)
        actions.user.german_paste(word)
        return word

    def german_fix_genus(word:str=None, text:str=None):
        """Retrieves the genus and puts it down."""
        if text is None:
            key("shift-tab")
            text = actions.user.german_anki_get_text(word)
            key("tab")
        try:
            m = {"m": "r", "n": "s", "f": "e"}
            der = m[text.split("Genus: ",1)[1][0]]
        except:
            der = None
        if der is None:
            return
        if word is None:
            word = actions.user.german_anki_get_word()
        word = f"{der} {word}"
        actions.edit.select_all()
        actions.sleep("100ms")
        actions.user.paste(word)
        actions.sleep("50ms")

    def german_all():
        """TODO"""
        word = actions.user.german_pronounce(None, True)
        text = actions.user.german_get_text(word)
        actions.user.german_fix_genus(word, text)
        actions.user.german_paste(word, text)

    def german_czech_translation():
        """Very specific"""
        text = actions.user.german_anki_get_text()
        try:
            words = text.split("* cs: ",1)[1].split("\n",1)[0].split(", ")
        except:
            words = ["ERR"]
        word = words[0]
        actions.user.paste(word)

@ctx.action_class("user")
class Actions:
    def pop():
        """TODO"""
        actions.key("ctrl-a")
        actions.user.pop_twice_to_toggle()
    
    def whistle_a():
        """TODO"""
        actions.user.switch_mode("command")

    def whistle_c():
        """TODO"""
        actions.user.switch_mode("user.czech")

    def whistle_e():
        """TODO"""
        actions.user.switch_mode("dictation")

    def whistle_g():
        """TODO"""
        actions.user.switch_mode("user.german")

#    def whistle_h():
#        """TODO"""
#        actions.key("escape")
#
    def whistle_h():
        """TODO"""
        predef_actions = {
            1: lambda: actions.key("tab"),
            2: lambda: actions.key("shift-tab:2"),
        }
        return actions.user.pop_counter(predef_actions, .3)

    #def click_back():
    #    """TODO"""
    #    actions.key("shift-tab")
