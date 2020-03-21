# -*- coding: utf-8 -*-

# Customizes the pytnon shell prompt.
# alias py='PYTHONSTARTUP=$HOME/bin/python-prompt.py python3.8'
# Source: https://arpitbhayani.me/blogs/python-prompts

import sys

class IPythonPromptPS1(object):

  def __init__(self):
    self.line = 0

  def __str__(self):
    self.line += 1
    return f"\033[92mIn [{self.line}]:\033[0m "

sys.ps1 = IPythonPromptPS1()
sys.ps2 = "    \033[1;34m...\033[0m "