# This file is a set of words that have common abbreviations, but in some cases
# entries will also include acronyms or more technical vernacular, such as
# 'brief pie -> py'

from talon import Context, Module

mod = Module()
mod.list("abbreviation", desc="Common abbreviation")

ctx = Context()
ctx.lists["user.abbreviation"] = {
    "address": "addr",
    "administrator": "admin",
    "administrators": "admins",
    "advance": "adv",
    "advanced": "adv",
    "alberta": "ab",
    "alternative": "alt",
    "application": "app",
    "applications": "apps",
    "argument": "arg",
    "arguments": "args",
    "as far as i can tell": "afaict",
    "as far as i know": "afaik",
    "assembly": "asm",
    "at the moment": "atm",
    "attribute": "attr",
    "attributes": "attrs",
    "authenticate": "auth",
    "authentication": "authn",
    "authorization": "authz",
    "auto group": "augroup",
    "away from keyboard": "afk",
    "backup": "bkp",
    "binary": "bin",
    "boolean": "bool",
    "british columbia": "bc",
    "button": "btn",
    "canada": "ca",
    "centimeter": "cm",
    "char": "chr",
    "character": "char",
    "chip": "cpu",
    "class": "cls",
    "client": "cli",
    "column": "col",
    "command": "cmd",
    "comment": "cmt",
    "compare": "cmp",
    "conference": "conf",
    "config": "cfg",
    "configuration": "config",
    "connection": "conn",
    "context": "ctx",
    "control": "ctrl",
    "control flow graph": "cfg",
    "constant": "const",
    "coordinate": "coord",
    "coordinates": "coords",
    "copy": "cpy",
    "count": "cnt",
    "counter": "ctr",
    "current": "cur",
    "cuddle": "ctl",
    "cute": "qt",
    "database": "db",
    "date format": "yyyy-mm-dd",
    "declare": "decl",
    "declaration": "decl",
    "decode": "dec",
    "decrement": "dec",
    "debug": "dbg",
    "define": "def",
    "definition": "def",
    "delete": "del",
    "description": "desc",
    "develop": "dev",
    "development": "dev",
    "device": "dev",
    "diagnostic": "diag",
    "dictation": "dict",
    "dictionary": "dict",
    "direction": "dir",
    "directory": "dir",
    "distribution": "dist",
    "document": "doc",
    "documents": "docs",
    "doing": "ing",  # some way to add 'ing' to verbs
    "double": "dbl",
    "dupe": "dup",
    "duplicate": "dup",
    "dynamic": "dyn",
    "elastic": "elast",  # elastdocker, elastalert, etc
    "encode": "enc",
    "end of day": "eod",
    "end of month": "eom",
    "end of quarter": "eoq",
    "end of week": "eow",
    "end of year": "eoy",
    "entry": "ent",
    "enumerate": "enum",
    "environment": "env",
    "error": "err",
    "escape": "esc",
    "etcetera": "etc",
    "ethernet": "eth",
    "example": "ex",
    "exception": "exc",
    "executable": "exe",
    "execute": "exec",
    "expression": "exp",
    "extend": "ext",
    "extension": "ext",
    "eye dent": "id",
    "eye low": "ilo",
    "file system": "fs",
    "fingerprint": "fp",
    "framework": "fw",
    "frequency": "freq",
    "function": "func",
    "funny": "lol",
    "fuzzy": "fzy",
    "generic": "gen",
    "generate": "gen",
    "hardware": "hw",
    "header": "hdr",
    "hello": "helo",
    "hi": "o/",
    "history": "hist",
    "hypertext": "http",
    "identity": "id",
    "image": "img",
    "import table": "iat",
    "import address table": "iat",
    "increment": "inc",
    "information": "info",
    "initialize": "init",
    "initializer": "init",
    "in real life": "irl",
    "instance": "inst",
    "integer": "int",
    "interrupt": "int",
    "iterate": "iter",
    "java archive": "jar",
    "javascript": "js",
    "jason": "json",
    "just in time": "jit",
    "jump": "jmp",
    "kay": "kk",
    "keyboard": "kbd",
    "keyword arguments": "kwargs",
    "keyword": "kw",
    "kilogram": "kg",
    "kilometer": "km",
    "language": "lang",
    "length": "len",
    "library": "lib",
    "lycanthrope": "lycan",
    "mail": "smtp",
    "make": "mk",
    "manitoba": "mb",
    "markdown": "md",
    "memory": "mem",
    "message": "msg",
    "meta sploit": "msf",
    "meta sploit framework": "msf",
    "microphone": "mic",
    "milligram": "mg",
    "millisecond": "ms",
    "miscellaneous": "misc",
    "modify": "mod",
    "module": "mod",
    "monitor": "mon",
    "mount": "mnt",
    "multiple": "multi",
    "nano second": "ns",
    "neo vim": "nvim",
    "new brunswick": "nb",
    "nova scotia": "ns",
    "number": "num",
    "object": "obj",
    "okay": "ok",
    "ontario": "on",
    "option": "opt",
    "operating system": "os",
    "original": "orig",
    "package": "pkg",
    "parameter": "param",
    "parameters": "params",
    "password": "passwd",
    "pico second": "ps",
    "pie": "py",
    "ping": "png",
    "pixel": "px",
    "performance": "perf",
    "point": "pt",
    "pointer": "ptr",
    "position": "pos",
    "position independent code": "pic",
    "position independent executable": "pie",
    "previous": "prev",
    "process": "proc",
    "processor": "cpu",
    "program": "prog",
    "property": "prop",
    "public": "pub",
    "python": "py",
    "quebec": "qc",
    "query string": "qs",
    "random": "rnd",
    "receipt": "rcpt",
    "record": "rec",
    "recording": "rec",
    "reference": "ref",
    "references": "refs",
    "register": "reg",
    "registery": "reg",
    "regular expression": "regex",
    "regular expressions": "regex",
    "remove": "rm",
    "repel": "repl",
    "repetitive strain injury": "rsi",
    "represent": "repr",
    "representation": "repr",
    "request": "req",
    "resource": "rsrc",
    "return": "ret",
    "revision": "rev",
    "ruby": "rb",
    "saskatchewan": "sk",
    "sequel": "sql",
    "sequence": "seq",
    "segment": "seg",
    "scuzzy": "scsi",
    "samba": "smb",
    "select": "sel",
    "service pack": "sp",
    "session id": "sid",
    "shell": "sh",
    "shellcode": "sc",
    "source": "src",
    "special": "spec",
    "specific": "spec",
    "specification": "spec",
    "specify": "spec",
    "standard in": "stdin",
    "standard out": "stdout",
    "standard": "std",
    "start of day": "sod",
    "start of month": "som",
    "start of quarter": "soq",
    "start of week": "sow",
    "start of year": "soy",
    "statistic": "stat",
    "statistics": "stats",
    "statement": "stmt",
    "string": "str",
    "structure": "struct",
    "symbol": "sym",
    "synchronize": "sync",
    "synchronous": "sync",
    "system": "sys",
    "table of contents": "toc",
    "table": "tbl",
    "taiwan": "tw",
    "technology": "tech",
    "temperature": "temp",
    "temporary": "tmp",
    "temp": "tmp",
    "text": "txt",
    "time of check time of use": "toctou",
    "time format": "hh:mm:ss",
    "time to live": "ttl",
    "token": "tok",
    "ultimate": "ulti",
    "unique id": "uuid",
    "user": "usr",
    "utilities": "utils",
    "utility": "util",
    "value": "val",
    "variable": "var",
    "verify": "vrfy",
    "version": "ver",
    "versus": "vs",
    "virtual machine": "vm",
    "visual": "vis",
    "visual studio": "msvc",
    "wave": "wav",
    "web": "www",
    "what the fuck": "wtf",
    "window": "win",
}


@mod.capture(rule="{user.abbreviation}")
def abbreviation(m) -> str:
    "One abbreviation"
    return m.abbreviation
