from talon import Context, actions
ctx = Context()
ctx.matches = r"""
os: linux
tag: user.gdb
"""

@ctx.action_class('user')
class UserActions:
    #tag(): user.pwndbg
    
    
    ##
    # Generic debugger actions
    ##
    
    # Code execution
    def debugger_step_into(): actions.auto_insert('stepi\n')
    def debugger_step_over(): actions.auto_insert('nexti\n')
    def debugger_step_line(): actions.auto_insert('step\n')
    def debugger_step_over_line(): actions.auto_insert('next\n')
    def debugger_step_out(): actions.auto_insert('finish\n')
    def debugger_continue(): actions.auto_insert('c\n')
    def debugger_stop(): actions.key('ctrl-c')
    def debugger_start(): actions.auto_insert('run\n')
    def debugger_restart(): actions.auto_insert('run\n')
    # XXX -
    def debugger_detach(): actions.auto_insert('')
    
    # Registers
    def debugger_show_registers(): actions.auto_insert('info registers\n')
    def debugger_get_register(): actions.auto_insert('i r ')
    def debugger_set_register():
        actions.insert('set $=')
        actions.edit.left()
        # Breakpoints
    def debugger_show_breakpoints(): actions.auto_insert('info breakpoints\n')
    def debugger_add_sw_breakpoint(): actions.auto_insert('break ')
    # XXX -
    def debugger_add_hw_breakpoint(): actions.auto_insert('')
    def debugger_break_now(): actions.key('ctrl-c')
    def debugger_break_here(): actions.auto_insert('break\n')
    def debugger_clear_all_breakpoints(): actions.auto_insert('d br\n')
    def debugger_clear_breakpoint():
        actions.insert('d br ')
    def debugger_enable_all_breakpoints():
        actions.insert('enable br\n')
    def debugger_enable_breakpoint():
        actions.insert('enable br ')
    def debugger_disable_all_breakpoints():
        actions.insert('disable br\n')
    def debugger_disable_breakpoint():
        actions.insert('disable br  ')
        # Analysis
    def debugger_backtrace(): actions.auto_insert('bt\n')
    def debugger_exit(): actions.auto_insert('quit\n')
    def debugger_exit_force(): actions.auto_insert('quit\ny\n')
    def debugger_disassemble_here():
        actions.insert('x/10i $pc\n')
        # Type inspection
    def debugger_dump_ascii_string():
        actions.insert('x/s ')
        ##
        # GDB specific functionality
        ##
        ## Common commands ##
