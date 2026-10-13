# ~/.bash_profile: executed by bash(1) for login shells.

# Switch to zsh is available and interactive
if [ -t 1 ] && [ -z "$ZSH_VERSION" ] && command -v zsh >/dev/null; then
  exec zsh -l
fi