alias b "brew"
alias bu "brew upgrade"
alias v "vim"
alias c "code"
alias g "git"
alias tmux-boei='tmux source-file ~/tmuxconf/tmux.boei.conf'
alias tmux-nssol='tmux source-file ~/tmuxconf/tmux.nssol.conf'
alias tmux-nssol-cfm='tmux source-file ~/tmuxconf/tmux.nssol-cfm.conf'
alias tmux-ctc-qfx='tmux source-file ~/dotfiles/tmux/ctc-qfx1.conf'
alias tmux-ml2='tmux source-file ~/dotfiles/tmux/ml2.conf'
alias tmux-sb='tmux source-file ~/dotfiles/tmux/sb.conf'
alias tmux-hb='tmux source-file ~/dotfiles/tmux/hb.conf'
alias tmux-hb-vmx='tmux source-file ~/dotfiles/tmux/hb-vmx.conf'
alias tmux-sb-qfx='tmux source-file ~/dotfiles/tmux/sb-qfx.conf'
alias tmux-fkcn='tmux source-file ~/dotfiles/tmux/fkcn.conf'
alias tmux-kolla='tmux source-file ~/dotfiles/tmux/kolla.conf'
alias tmux-k8smc='tmux source-file ~/dotfiles/tmux/k8smc.conf'
alias wr='claude-code -f ~/prompts/weekly_review_prompt.txt'

abbr -a gco git checkout
set -x GOPATH $HOME/go/
set -x PATH /opt/homebrew/bin/ $PATH
set -x PATH $HOME/dev/flutter/bin $PATH
set -x PATH ~/miniforge3/bin $PATH

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/yamamoto/.lmstudio/bin

# Added by Windsurf
fish_add_path /Users/yamamoto/.codeium/windsurf/bin
fish_add_path $HOME/.local/bin
