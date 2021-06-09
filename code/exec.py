import os
import subprocess

from talon import Module

mod = Module()


@mod.action_class
class Actions:
    def system_command(cmd: str):
        """execute a command on the system"""
        os.system(cmd)

    def system_command_nb(cmd: str):
        """execute a command on the system without blocking"""
        subprocess.Popen(cmd, shell=True)

    def system_command_capture(cmd: str):
        """execute a command on the system, return its output"""
        return subprocess.run(cmd.split(), stdout=subprocess.PIPE).stdout.decode('utf-8').strip()
