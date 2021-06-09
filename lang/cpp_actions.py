from talon import Context, actions
ctx = Context()
ctx.matches = r"""
code.language: cplusplus
"""

@ctx.action_class('user')
class UserActions:
    def code_operator_indirection():           actions.auto_insert('*')
    def code_operator_address_of():            actions.auto_insert('&')
    def code_operator_structure_dereference(): actions.auto_insert('->')
    #action(user.code_operator_lambda): "=>"
    def code_operator_subscript():
        actions.insert('[]')
        actions.key('left')
    def code_operator_assignment():                      actions.auto_insert(' = ')
    def code_operator_subtraction():                     actions.auto_insert(' - ')
    def code_operator_subtraction_assignment():          actions.auto_insert(' -= ')
    def code_operator_addition():                        actions.auto_insert(' + ')
    def code_operator_addition_assignment():             actions.auto_insert(' += ')
    def code_operator_multiplication():                  actions.auto_insert(' * ')
    def code_operator_multiplication_assignment():       actions.auto_insert(' *= ')
    #action(user.code_operator_exponent): " ** "
    def code_operator_division():                        actions.auto_insert(' / ')
    def code_operator_division_assignment():             actions.auto_insert(' /= ')
    def code_operator_modulo():                          actions.auto_insert(' % ')
    def code_operator_modulo_assignment():               actions.auto_insert(' %= ')
    def code_operator_equal():                           actions.auto_insert(' == ')
    def code_operator_not_equal():                       actions.auto_insert(' != ')
    def code_operator_greater_than():                    actions.auto_insert(' > ')
    def code_operator_greater_than_or_equal_to():        actions.auto_insert(' >= ')
    def code_operator_less_than():                       actions.auto_insert(' < ')
    def code_operator_less_than_or_equal_to():           actions.auto_insert(' <= ')
    def code_operator_and():                             actions.auto_insert(' && ')
    def code_operator_or():                              actions.auto_insert(' || ')
    def code_operator_bitwise_and():                     actions.auto_insert(' & ')
    def code_operator_bitwise_and_assignment():          actions.auto_insert(' &= ')
    def code_operator_bitwise_or():                      actions.auto_insert(' | ')
    def code_operator_bitwise_or_assignment():           actions.auto_insert(' |= ')
    def code_operator_bitwise_exclusive_or():            actions.auto_insert(' ^ ')
    def code_operator_bitwise_exclusive_or_assignment(): actions.auto_insert(' ^= ')
    def code_operator_bitwise_left_shift():              actions.auto_insert(' << ')
    def code_operator_bitwise_left_shift_assignment():   actions.auto_insert(' <<= ')
    def code_operator_bitwise_right_shift():             actions.auto_insert(' >> ')
    def code_operator_bitwise_right_shift_assignment():  actions.auto_insert(' >>= ')
    def code_self():                                     actions.auto_insert('this')
    def code_null():                                     actions.auto_insert('nullptr')
    def code_is_null():                                  actions.auto_insert(' == nullptr ')
    def code_is_not_null():                              actions.auto_insert(' != nullptr')
    def code_state_if():
        actions.insert('if ()')
        actions.key('left')
    def code_state_else_if():
        actions.insert('else if ()')
        actions.key('left')
    def code_state_else():
        actions.insert('else {\n}\n')
        actions.key('up')
    def code_state_switch():
        actions.insert('switch ()')
        actions.edit.left()
    def code_state_case():
        actions.insert('case \nbreak;')
        actions.edit.up()
    def code_state_for():
        actions.auto_insert('for ()')
        actions.edit.left()
    def code_state_for_each():
        actions.insert('for (auto  : ) ')
        actions.key('left:5')
    def code_state_go_to(): actions.auto_insert('go to ')
    def code_state_while():
        actions.insert('while()')
        actions.edit.left()
    def code_type_definition():                 actions.auto_insert('typedef ')
    #action(user.code_typedef_struct):
    #	insert("typedef struct")
    #	insert("{{\n\n}}")
    #	edit.up()
    #	key(tab)
    def code_type_class():                      actions.auto_insert('class ')
    def code_import():                          actions.auto_insert('using  ')
    def code_from_import():                     actions.auto_insert('using ')
    def code_include():                         actions.auto_insert('#include ')
    def code_include_system():                  actions.auto_insert('#include ')
    def code_include_local():                   actions.auto_insert('#include ')
    def code_comment():                         actions.auto_insert('//')
    
    #todo: figure out how to handle typing beyond "void"
    def code_private_function(text: str):       actions.insert('private void ')
    def code_public_static_function(text: str): actions.insert('private static void ')
    def code_protected_function(text: str):     actions.insert('protected void ')
    def code_public_function(text: str):        actions.insert('public void ')
