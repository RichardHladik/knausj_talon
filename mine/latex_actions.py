from talon import Context, actions
ctx = Context()
ctx.matches = r"""
mode: command
code.language: tex
"""

@ctx.action_class('user')
class UserActions:
    def code_operator_subscript():
        actions.insert('_{}')
        actions.key('left')
    def code_operator_assignment():     actions.auto_insert(' \\coloneqq ')
    def code_operator_subtraction():    actions.auto_insert(' - ')
    def code_operator_addition():       actions.auto_insert(' + ')
    def code_operator_multiplication(): actions.auto_insert(' \\cdot ')
    def code_operator_exponent():
        actions.insert('^{}')
        actions.key('left')
    def code_operator_division():                 actions.auto_insert(' / ')
    def code_operator_modulo():                   actions.auto_insert(' \\bmod ')
    def code_operator_equal():                    actions.auto_insert(' = ')
    def code_operator_not_equal():                actions.auto_insert(' \\ne ')
    def code_operator_greater_than():             actions.auto_insert(' > ')
    def code_operator_greater_than_or_equal_to(): actions.auto_insert(' \\ge ')
    def code_operator_less_than():                actions.auto_insert(' < ')
    def code_operator_less_than_or_equal_to():    actions.auto_insert(' \\le ')
    def code_operator_and():                      actions.auto_insert(' \\wedge ')
    def code_operator_or():                       actions.auto_insert(' \\vee ')
    def code_operator_bitwise_and():              actions.auto_insert(' \\& ')
    def code_operator_bitwise_or():               actions.auto_insert(' | ')
    def code_operator_bitwise_exclusive_or():     actions.auto_insert(' \\oplus ')
    def code_null():                              actions.auto_insert('\\emptyset')
    def code_comment():                           actions.auto_insert('%')
    def code_operator_in():                       actions.auto_insert(' \\in ')
