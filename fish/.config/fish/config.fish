alias b "brew"
alias bu "brew upgrade"
alias v "vim"
alias c "code"
alias g "git"

set -x GOPATH $HOME/go/
set -x PATH /opt/homebrew/bin/ $PATH
set -x PATH $HOME/dev/flutter/bin $PATH
set -x PATH ~/miniforge3/bin $PATH

if status is-interactive
    # 既存のエイリアス
    alias c="clear"
    alias e="exit"

    # Modern Unix エイリアス
    alias ls="eza --icons --git --no-user"
    alias ll="eza -l --icons --git --no-user"
    alias la="eza -la --icons --git --no-user"
    alias tree="eza --tree --icons"
    alias cat="bat"
    alias grep="rg"

    # ツールの初期化 (これがないと動きません)
    starship init fish | source
    zoxide init fish | source
    mise activate fish | source

    # Zellijの外の時、実行
    if not set -q ZELLIJ
        exec zellij
    end
end

abbr -a gco git checkout

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/yamamoto/.lmstudio/bin
