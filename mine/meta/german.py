from talon import Context, Module
mod = Module()
mod.mode('german')
ctx = Context()
ctx.matches = 'mode: user.german'
ctx.settings = {
    'speech.language': 'de_DE',
    'speech.engine': 'webspeech',
}
