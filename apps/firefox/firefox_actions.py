from talon import Context, actions
ctx = Context()
ctx.matches = r"""
app: firefox
"""

@ctx.action_class('browser')
class BrowserActions:
    # TODO
    #action(browser.address):
    #action(browser.title):
    
    def focus_search():
        actions.browser.focus_address()
    def submit_form():
        actions.key('enter')
