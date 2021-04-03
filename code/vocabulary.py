from talon import Context, Module, actions, grammar

# user-defined words that aren't matching in lexicon
simple_vocabulary = [
    "Cisco",
    "Citrix",
    "DNS",
    "VPN",
    "admin",
    "afl",
    "alloc",
    "asa",
    "binja",
    "blah",
    "byte",
    "bytes",
    "cedric",
    "cert",
    "cfg",
    "cve",
    "daemon",
    "debbi",
    "dll",
    "dlmalloc",
    "docker",
    "dotfiles",
    "ecdsa",
    "edg",
    "errno",
    "exim",
    "fastbin",
    "firefox",
    "freebsd",
    "fuzz",
    "fuzzer",
    "ghidra",
    "github",
    "hal",
    "hexdump",
    "ida",
    "idarling",
    "ios",
    "kk",
    "lambda",
    "malloc",
    "meta",
    "metasploit",
    "minecraft",
    "mplayer",
    "mscope",
    "ncc group",
    "neovim",
    "netbsd",
    "nmap",
    "openbsd",
    "patreon",
    "pfsense",
    "poc",
    "ptmalloc",
    "pwn",
    "relro",
    "rootkit",
    "rop",
    "rrsp",
    "rsa",
    "shellcode",
    "ssh",
    "strmixalot",
    "tcache",
    "tfsa",
    "gvim",
    "vim",
    "vimrc",
    "vmware",
    "vimium",
    "yammer",
    "sys",
    "argv",
    "parser",
    "gitlab",
    "wisp",
    "vimvixen",
    "vps",
    "admin",
    "debug",
    "debian",
    "aenea",
    "edit",
    "auto",
    "modules",
    "buf",
    "args",
    "parse",
    "var",
    "arena",
    "main",
    "scroll",
    "scrolling",
    "fastbin",
    "console",
    "integer",
    "pentest",
    "Aaron",
    "tmux",
    "keying",
    "tool",
    "exe",
    "unix",
    "buffer",
    "ncc",
    "nccgroup",
    "draft",
    "donut",
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
    "and or": "and/or",
    "this joint": "disjoint",
    "waited": "weighted",
    "awaited": "weighted",
}

# Add single words here if Talon recognizes them, but they need to have their
# capitalization adjusted.
capitalize = [
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


# Add words (or phrases you want treated as words) here if Talon doesn't
# recognize them at all.
mapping_vocabulary.update(dict(zip(simple_vocabulary, simple_vocabulary)))

word_map.update({x.lower(): x for x in capitalize})
word_map.update({x: x.lower() for x in decapitalize})
mapping_vocabulary.update({x: x.replace(" ", "-") for x in hyphenise})
mapping_vocabulary.update({x: x.replace(" ", "") for x in condense})

mod = Module()


@mod.capture(rule="{user.vocabulary}")
def vocabulary(m) -> str:
    return m.vocabulary


@mod.capture(rule="(<user.vocabulary> | <word>)")
def word(m) -> str:
    try:
        return m.vocabulary
    except AttributeError:
        # TODO: if the word is both a regular word AND user.vocabulary, then in
        # principle it may parse as <word> instead; we ought to pass it through
        # mapping_vocabulary to be sure. But we should be doing that in
        # user.text, below, too.
        words = actions.dictate.replace_words(actions.dictate.parse_words(m.word))
        assert len(words) == 1
        return words[0]


punctuation = set(".,-!?;:")


@mod.capture(rule="(<user.vocabulary> | <phrase>)+")
def text(m) -> str:
    words = []
    for item in m:
        if isinstance(item, grammar.vm.Phrase):
            words.extend(
                actions.dictate.replace_words(actions.dictate.parse_words(item))
            )
        else:
            words.extend(item.split(" "))

    result = ""
    for i, word in enumerate(words):
        if i > 0 and word not in punctuation and words[i - 1][-1] not in ("/-("):
            result += " "
        result += word
    return result


mod.list("vocabulary", desc="user vocabulary")

ctx = Context()

# dictate.word_map is used by actions.dictate.replace_words to rewrite words
# Talon recognized. Entries in word_map don't change the priority with which
# Talon recognizes some words over others.
ctx.settings["dictate.word_map"] = word_map

# user.vocabulary is used to explicitly add words/phrases that Talon doesn't
# recognize. Words in user.vocabulary (or other lists and captures) are
# "command-like" and their recognition is prioritized over ordinary words.
ctx.lists["user.vocabulary"] = mapping_vocabulary
