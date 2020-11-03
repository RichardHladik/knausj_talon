from talon import Context, actions

ctx = Context()


@ctx.action_class("core")
class Actions:
    def run_talon_script(ctx, script, m):
        with ctx:
            print(f"CONTEXT: {ctx}")
            print(f"SCRIPT: {script}")
            print(f"COMMAND: {m}")
            # script.run(actions, namespace=m)
            actions.next(ctx, script, m)
