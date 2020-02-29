#!/usr/bin/env bash
set -ue

helpmsg() {
    command echo "Usage: $0 [--help | -h]" 0>&2
    command echo ""
}

link_to_homedir() {
    command echo "backup old dotfiles..."
    if [ ! -d "$HOME/.dotbackup" ]; then
      command echo "$HOME/.dotbackup not found. Auto Make it"
      command mkdir "$HOME/.dotbackup"
    fi
}

link_to_homedir
command echo -e "Install completed!!!!"