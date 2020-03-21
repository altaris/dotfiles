#!/usr/bin/env sh

LS_COLORS_FILE=../dotfiles/.ls_colors
TEST_DIR=.ls_colors.test

mkdir "$TEST_DIR" > /dev/null 2>&1

for FILE in $(cat "$LS_COLORS_FILE" | gawk 'match($0, /^\**([^\*# ]+)/, m) { print m[1]; }'); do
    touch "$TEST_DIR"/"$FILE"
done

eval "$(dircolors "$LS_COLORS_FILE")"
ls -A --color=auto "$TEST_DIR"
