#!/bin/bash

ROOT="$HOME/.config/starship/git_fetch_mtime"
TARGET="$ROOT/git_fetch_mtime"
SRC="$ROOT/main.c"

if [ -x "$TARGET" ]; then
    "$TARGET"
else
    clang "$SRC" -o "$TARGET" -O3
    if [ $? -eq 0 ]; then
        "$TARGET"
    fi
fi
