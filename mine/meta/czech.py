from talon import Context, Module
mod = Module()
mod.mode('czech')
ctx = Context()
ctx.matches = 'mode: user.czech'
ctx.settings = {
    'speech.language': 'cs_CZ',
    'speech.engine': 'webspeech',
}
