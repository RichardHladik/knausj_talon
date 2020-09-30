from talon import speech_system, Context
from talon.engines.w2l import WebW2lEngine, W2lEngine
from talon.engines.webspeech import WebSpeechEngine

#w2l = W2lEngine(language='en_US', debug=False)
w2l = W2lEngine(language='en_US-sconv-large-b2', debug=False)
speech_system.add_engine(w2l)
webspeech = WebSpeechEngine()
speech_system.add_engine(webspeech)# set the default engine

ctx = Context()
ctx.settings = {
    'speech.engine': 'wav2letter',
}
