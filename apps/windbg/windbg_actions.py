from talon import Context, actions
ctx = Context()
ctx.matches = r"""
# XXX - trigger alt-1 to hit command window for necessary commands?
# ex: user.windbg_insert_in_cmd()
#    edit.left()

mode: user.windbg
"""

@ctx.action_class('user')
class UserActions:
    ##
    # Generic debugger actions
    ##
    
    # Code execution
    def debugger_step_into():
        actions.key('f8')
    def debugger_step_over():
        actions.key('f10')
        # XXX -
    def debugger_step_line(): actions.auto_insert('')
    def debugger_step_over_line(): actions.auto_insert('')
    
    def debugger_step_out():
        actions.key('shift-f11')
    def debugger_continue():
        actions.key('f5')
    def debugger_stop():
        actions.key('shift-f5')
    def debugger_restart():
        actions.key('ctrl-shift-f5')
    def debugger_detach():
        actions.insert('.detach')
        # Registers
    def debugger_show_registers():
        actions.key('r enter')
    def debugger_get_register():
        actions.insert('r @')
    def debugger_set_register():
        actions.insert('set $@=')
        actions.edit.left()
        # Breakpoints
    def debugger_show_breakpoints():
        actions.insert('bl\n')
    def debugger_add_sw_breakpoint():
        actions.insert('bp ')
    def debugger_add_hw_breakpoint():
        actions.insert('ba e 1 ')
    def debugger_break_now():
        actions.key('ctrl-break')
        # XXX
    def debugger_break_here(): actions.auto_insert('')
    def debugger_clear_all_breakpoints():
        actions.insert('bc *\n')
    def debugger_clear_breakpoint():
        actions.insert('bc ')
    def debugger_enable_all_breakpoints():
        actions.insert('be *\n')
    def debugger_enable_breakpoint():
        actions.insert('be ')
    def debugger_disable_all_breakpoints():
        actions.insert('bd *\n')
    def debugger_disable_breakpoint():
        actions.insert('bd ')
        # Navigation
    def debugger_goto_address():
        actions.insert('ctrl-g')
    def debugger_goto_clipboard():
        actions.insert('ctrl-g')
        actions.edit.paste()
        actions.key('enter')
    def debugger_goto_highlighted():
        actions.insert('ctrl-g')
        actions.edit.copy()
        actions.edit.paste()
        actions.key('enter')
        # Memory inspection
    def debugger_backtrace():
        actions.key('k enter')
    def debugger_disassemble():
        actions.key('u space')
    def debugger_disassemble_here():
        actions.key('u enter')
    def debugger_disassemble_clipboard():
        actions.key('u space')
        actions.edit.paste()
        actions.key('enter')
    def debugger_dump_ascii_string():
        actions.insert('da ')
    def debugger_dump_unicode_string():
        actions.insert('du ')
    def debugger_dump_pointers():
        actions.insert('dps ')
    def debugger_list_modules():
        actions.insert('lm\n')
        # Registers depend on architecture mode
    def debugger_inspect_type():
        actions.insert('dt ')
        # Convenience
    def debugger_clear_line():
        actions.key('ctrl-a backspace')
        ##
        # Windbg specific functionality
        ##