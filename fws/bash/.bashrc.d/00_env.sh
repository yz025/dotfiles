function append_path() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

append_path "$HOME/Documents/projects/tocp/bin"
append_path "$HOME/Documents/projects/git_fetch_mtime" # git_fetch_mtime

export EDITOR="nvim"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# ssh agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
if [ ! -S "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -a "$SSH_AUTH_SOCK")" > /dev/null
fi
