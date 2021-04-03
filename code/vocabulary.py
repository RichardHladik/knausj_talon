from talon import Context, Module
from .user_settings import get_list_from_csv

# user-defined words that aren't matching in lexicon
simple_vocabulary = [
    "DNS",
    "VPN",
    "admin",
    "alloc",
    "blah",
    "byte",
    "bytes",
    "cert",
    "cfg",
    "cve",
    "daemon",
    "dll",
    "docker",
    "dotfiles",
    "ecdsa",
    "errno",
    "exim",
    "firefox",
    "freebsd",
    "fuzz",
    "fuzzer",
    "github",
    "hexdump",
    "ios",
    "lambda",
    "malloc",
    "meta",
    "minecraft",
    "mplayer",
    "neovim",
    "nmap",
    "openbsd",
    "patreon",
    "rootkit",
    "rsa",
    "shellcode",
    "ssh",
    "gvim",
    "vim",
    "vimrc",
    "vmware",
    "sys",
    "argv",
    "parser",
    "gitlab",
    "vimvixen",
    "vps",
    "admin",
    "debug",
    "debian",
    "edit",
    "auto",
    "modules",
    "buf",
    "args",
    "parse",
    "var",
    "main",
    "scroll",
    "scrolling",
    "console",
    "integer",
    "tmux",
    "keying",
    "tool",
    "exe",
    "unix",
    "buffer",
    "draft",
    "insert",
    "payload",
    "disk",
    "diskless",
    "loader",
    "ascii",
    "disk",
    "markdown",
    "BSD",
    "bool",
    "keying",
    "env",
    "tags",
    "PE",
    "raw",
    "page",
    "add",
    "octet",
    "dev",
    "calc",
    "close",
    "gandi",
    "memset",
    "polybar",
    "yay",
    "buku",
    "tech",
    "hover",
    "davmail",
    "break",
    "pico",
    "add",
    "giffed",
    "gif",
    "LUKS",
    "able",
    "metasploit",
    "mod",
    "most",
    "mouse",
    "timeout",
    "array",
    "arrays",
    "ping",
    "stellaris",
    "config",
    "make",
    "stub",
    "stubs",
]

simple_vocabulary = [
    "decidability",
    "enumerable",
]

hyphenise = [
    "self esteem",
]

condense = [
    "non empty",
    "non zero",
]

mapping_vocabulary = {
    "and u s kernel": "ntoskrnl",
    "as break": "sbrk",
    "as p one": "sp1",
    "as p three": "sp3",
    "as p to": "sp2",
    "base sixty four": "base64",
    "colonel": "kernel",
    "damon": "daemon",
    "din dns": "dynDNS",
    "dot b s s": ".bss",
    "dot data": ".data",
    "dot text": ".text",
    "drawio": "draw.io",
    "em protect": "mprotect",
    "ex ease": "exes",
    "ex ee": "exe",
    "fast bin": "fastbin",
    "foss": "fuzz",
    "frack": "phrack",
    "gee lib see": "glibc",
    "hack stump": "hexdump",
    "he low": "helo",
    "heck stump": "hexdump",
    "her go dogs": "ergodox",
    "hex raise": "hexrays",
    "higher key": "heirarchy",
    "i low": "ilo",
    "i three wm": "i3wm",
    "i three": "i3",
    "i": "I",
    "i'd": "I'd",
    "i'll": "I'll",
    "i'm": "I'm",
    "i've": "I've",
    "lib heap": "libheap",
    "lib see": "libc",
    "look aside": "lookaside",
    "ma map": "mmap",
    "no prob": "np",
    "of by one": "off by one",
    "parky": "poccy",
    "pound bag": "pwndbg",
    "rob": "rop",
    "shaw one": "sha1",
    "sixty for bit": "64-bit",
    "steer makes a lot": "strmixalot",
    "stir copy": "strcpy",
    "tay yo": "teo",
    "tea cash": "tcache",
    "thirty too bit": "32-bit",
    "two key eight": "2k8",
    "two key nineteen": "2k19",
    "two key sixteen": "2k16",
    "two key three": "2k3",
    "two key twelve": "2k12",
    "utt fight": "utf-8",
    "win thirty two k": "win32k",
    "win two key eight": "win2k8",
    "win two key nineteen": "win2k19",
    "win two key sixteen": "win2k16",
    "win two key three": "win2k3",
    "win two key twelve": "win2k12",
    "wind bag": "windbg",
    "ex eighty six": "x86",
    "ax eighty six": "x86",
    "a city six": "x86",
    "ex sixty four": "x64",
    "a sixty four": "x64",
    "ax sixty four": "x64",
    "key pass": "keepass",
    "eye three": "i3",
    "an am cli": "nmcli",
    "petty chunk": "ptchunk",
    "ped chunk": "ptchunk",
    "arg v": "argv",
    "arcpurse": "argparse",
    "arg purse": "argparse",
    "hedra": "ghidra",
    "heedra": "ghidra",
    "double you get": "wget",
    "wasn": "watson",
    "wardson": "watson",
    "g vim": "gvim",
    "gee vim": "gvim",
    "lay thick": "latex",
    "lay tech": "latex",
    "out or tune": "outotune",
    "midi": "MIDI",
    "lv2": "LV2",
    "vst2": "VST2",
    "gooey": "GUI",
    "api": "API",
    "nanovg": "NanoVG",
    "lagrangian": "Lagrangian",
    "mcms": "MCMF",
    "mcmf": "MCMF",
    "mc mf": "MCMF",
    "frank wolfe": "Frank-Wolfe",
    "frank wolf": "Frank-Wolfe",
    "fw": "FW",
    "multi commodity": "multicommodity",
    "multi flow": "multiflow",
    "multiflo": "multiflow",
    "multi circulation": "multicirculation",
    "pep eight": "pep8",
    "debbie an": "debian",
    "anne": "aenea",
    "all t snips": "ultisnips",
    "tcp dump": "tcpdump",
    "I notify": "inotify",
    "de bug": "debug",
    "buf her": "buffer",
    "head her": "header",
    "help her": "helper",
    "see seeing": "cc'ing",
    "ex ee": "exe",
    "xiii": "exe",
    "windows ten": "windows 10",
    "windows seven": "windows ",
    "ncc group": "nccgroup",
    "ex or": "xor",
    "sea sharp": "c#",
    "sea file": "c file",
    "in cert": "insert",
    "sand box": "sandbox",
    "use her": "user",
    "pentest her": "pentester",
    "test her": "tester",
    "asked I": "ascii",
    "ask I": "ascii",
    "get ignore": ".gitignore",
    "data tapes": "datatypes",
    "e numb": "enum",
    "king": "keying",
    "do main": "domain",
    "eye pee": "IP",
    "pee e": "PE",
    "arm sixty four": "ARM64",
    "arm thirty two": "ARM32",
    "dot ex e": ".exe",
    "desk top": "desktop",
    "dot net": ".NET",
    "etcetera": ", etc.",
    "I all": "hi all",
    "windbag": "windbg",
    "bite": "byte",
    "bites": "bytes",
    "jiffed": "giffed",
    "jiff": "gif",
    "lux": "LUKS",
    "vest where": "vmware",
    "lamby": "lambai",
    "four matters": "formatters",
    "meta exploit": "metasploit",
    "toby": "tobii",
    "you id": "UUID",
    "goo id": "GUID",
    # weird common typo
    "dolores": "stellaris",
    "sinology": "synology",
}

mapping_vocabulary = {
    "and or": "and/or",
    "this joint": "disjoint",
    "waited": "weighted",
    "awaited": "weighted",
}

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
    "Turing",
    "German"
]

decapitalize = [
    "Express",
    "Edge",
    "Cycle",
    "Cycles",
]

# Add single words here if Talon recognizes them, but they need to have their
# spelling adjusted.
word_map = {
    # For example:
    "color": "colour",
    "realize": "realise",
}


# WARNING XXX TODO: ^ this is old and not recognised, put into csvs


# Add words (or phrases you want treated as words) here if Talon doesn't
# recognize them at all.
mapping_vocabulary.update(dict(zip(simple_vocabulary, simple_vocabulary)))

word_map.update({x.lower(): x for x in capitalize})
word_map.update({x: x.lower() for x in decapitalize})
mapping_vocabulary.update({x: x.replace(" ", "-") for x in hyphenise})
mapping_vocabulary.update({x: x.replace(" ", "") for x in condense})

# Default words that need to be remapped.
_word_map_defaults = {
    # E.g:
    # "cash": "cache",
}
_word_map_defaults.update({word.lower(): word for word in _capitalize_defaults})


# "dictate.word_map" is used by `actions.dictate.replace_words` to rewrite words
# Talon recognized. Entries in word_map don't change the priority with which
# Talon recognizes some words over others.

ctx.settings["dictate.word_map"] = get_list_from_csv(
    "words_to_replace.csv",
    headers=("Replacement", "Original"),
    default=_word_map_defaults,
)


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
ctx.lists["user.vocabulary"] = get_list_from_csv(
    "additional_words.csv",
    headers=("Word(s)", "Spoken Form (If Different)"),
    default=_default_vocabulary,
)

# for quick verification of the reload
# print(str(ctx.settings["dictate.word_map"]))
# print(str(ctx.lists["user.vocabulary"]))
