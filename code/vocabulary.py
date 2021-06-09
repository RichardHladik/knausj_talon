from talon import Context, Module
from .user_settings import get_list_from_csv, register_csv_to_context

mod = Module()
ctx = Context()

mod.list("vocabulary", desc="additional vocabulary words")


# Default words that will need to be capitalized (particularly under w2l).
# NB. These defaults and those later in this file are ONLY used when
# auto-creating the corresponding settings/*.csv files. Those csv files
# determine the contents of user.vocabulary and dictate.word_map. Once they
# exist, the contents of the lists/dictionaries below are irrelevant.
_capitalize_defaults = [
    "I",
    "I'm",
    "I've",
    "I'll",
    "I'd",
    "Monday",
    "Mondays",
    "Tuesday",
    "Tuesdays",
    "Wednesday",
    "Wednesdays",
    "Thursday",
    "Thursdays",
    "Friday",
    "Fridays",
    "Saturday",
    "Saturdays",
    "Sunday",
    "Sundays",
    "January",
    "February",
    # March omitted because it's a regular word too
    "April",
    # May omitted because it's a regular word too
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
]

# Default words that need to be remapped.
_word_map_defaults = {
    # E.g:
    # "cash": "cache",
}
_word_map_defaults.update({word.lower(): word for word in _capitalize_defaults})


# "dictate.word_map" is used by `actions.dictate.replace_words` to rewrite words
# Talon recognized. Entries in word_map don't change the priority with which
# Talon recognizes some words over others.

def update_word_map(mode="dictation"):
    csvs = {
        "dictation": ["words_to_replace.csv", "replace_english.csv"],
        "user.czech": ["words_to_replace.csv", "replace_czech.csv"],
        "user.german": ["words_to_replace.csv", "replace_german.csv"]
    }

    word_map = {}
    if mode not in csvs:
        mode = "dictation"
    for csv in csvs[mode]:
        word_map.update(get_list_from_csv(
            csv,
            headers=("Replacement", "Original"),
            default={},
        ))

    ctx.settings["dictate.word_map"] = word_map

update_word_map()


# Default words that should be added to Talon's vocabulary.
_simple_vocab_default = ["nmap", "admin", "Cisco", "Citrix", "VPN", "DNS", "Minecraft"]

# Defaults for different pronounciations of words that need to be added to
# Talon's vocabulary.
_default_vocabulary = {
    "N map": "nmap",
    "under documented": "under-documented",
}
_default_vocabulary.update({word: word for word in _simple_vocab_default})
# "user.vocabulary" is used to explicitly add words/phrases that Talon doesn't
# recognize. Words in user.vocabulary (or other lists and captures) are
# "command-like" and their recognition is prioritized over ordinary words.
register_csv_to_context(ctx, "additional_words.csv", "user.vocabulary", ("Word(s)", "Spoken Form (If Different)"), _default_vocabulary)

# for quick verification of the reload
#print(str(ctx.settings["dictate.word_map"]))
# print(str(ctx.lists["user.vocabulary"]))
