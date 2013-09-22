# .zshrc

# emacsっぽく
bindkey -e

# ディレクトリ名でcdする
setopt auto_cd

# 補完
autoload -U compinit && compinit -u

# 補完に関するオプション
setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt list_types            # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt auto_menu             # 補完キー連打で順に補完候補を自動で補完
setopt auto_param_keys       # カッコの対応などを自動的に補完
setopt interactive_comments  # コマンドラインでも # 以降をコメントと見なす
setopt magic_equal_subst     # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる

setopt complete_in_word      # 語の途中でもカーソル位置で補完
setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示

setopt print_eight_bit       # 日本語ファイル名等8ビットを通す
setopt extended_glob         # 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
setopt globdots              # 明確なドットの指定なしで.から始まるファイルをマッチ

setopt no_beep               # 補完候補がないときなどにビープ音を鳴らさない。
setopt list_packed           # 補完候補リストを詰めて表示
setopt auto_list             # 補完候補が複数ある時に、一覧表示する

## 補完方法毎にグループ化する。
### 補完方法の表示方法
###   %B...%b: 「...」を太字にする。
###   %d: 補完方法のラベル
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''

## 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。
###           ただし、補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2

## 補完候補に色を付ける。
### "": 空文字列はデフォルト値を使うという意味。
zstyle ':completion:*:default' list-colors ""

## 補完候補がなければより曖昧に候補を探す。
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

## 補完方法の設定。指定した順番に実行する。
### _oldlist 前回の補完結果を再利用する。
### _complete: 補完する。
### _match: globを展開しないで候補の一覧から補完する。
### _history: ヒストリのコマンドも補完候補とする。
### _ignored: 補完候補にださないと指定したものも補完候補とする。
### _approximate: 似ている補完候補も補完候補とする。
### _prefix: カーソル以降を無視してカーソル位置までで補完する。
zstyle ':completion:*' completer \
    _oldlist _complete _match _history _ignored _approximate _prefix

## 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes
## 詳細な情報を使う。
zstyle ':completion:*' verbose yes
## sudo時にはsudo用のパスも使う。
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"

setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
cdpath=(~)
chpwd_functions=($chpwd_functions dirs)
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIS=$HISTSIZE
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# 便利なプロンプト。
setopt prompt_subst
autoload colors
colors

# 色の定義
local DEFAULT=$'%{\e[1;0m%}'
local RESET="%{${reset_color}%}"
local GREEN="%{${fg[green]}%}"
local BLUE="%{${fg[blue]}%}"
local RED="%{${fg[red]}%}"
local CYAN="%{${fg[cyan]}%}"
local LIGHT_BLUE=$'%{^[[1;36m%}'$
local WHITE="%{${fg[white]}%}"

## バージョン管理システムの情報も表示する
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats \
  '(%{%F{white}%K{green}%}%s%{%f%k%})-[%{%F{white}%K{blue}%}%b%{%f%k%}]'
zstyle ':vcs_info:*' actionformats \
  '(%{%F{white}%K{green}%}%s%{%f%k%})-[%{%F{white}%K{blue}%}%b%{%f%k%}|%{%F{white}%K{red}%}%a%{%f%k%}]'

#precmd () {
#  psvar=()
#  LANG=en_US.UTF-8 vcs_info
#  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
#}

bar_left="%{${CYAN}%}${USER}($?) ${RESET}${WHITE}$ ${RESET}"
bar_left_self="(%{%B%}%n%{%b%})"
bar_left_status="(%{%B%F{white}%(?.%K{green}.%K{red})%}%?%{%k%f%b%})"
bar_left_date="<%{%B%}%D{%Y/%m/%d %H:%M}%{%b%}>"
bar_left="-${bar_left_self}-${bar_left_status}-${bar_left_date}-"
prompt_left="-[%h]%(1j,(%j),) %{%F{cyan}%}%# %{%f%}"
PROMPT="${bar_left}"$'\n'"${prompt_left}"
RPROMPT='${RESET}${WHITE}[${GREEN}%(5~,%-2~/.../%2~,%~)% ${WHITE}]${RESET}'
RPROMPT="%1(v|%F{green}%1v%f|)"
RPROMPT="[%{%B%F{white}%K{magenta}%}%~%{%k%f%b%}]"

#function powerline_precmd() {
#  export PS1="$(~/powerline-shell.py $? --shell zsh)"
#}
#
#function install_powerline_precmd() {
#  for s in "${precmd_functions[@]}"; do
#    if [ "$s" = "powerline_precmd" ]; then
#      return
#    fi
#  done
#  precmd_functions+=(powerline_precmd)
#}
#
#install_powerline_precmd

#PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# tmuxの自動起動
if [ -z "$TMUX" -a -z "$STY" ]; then
    if type tmuxx >/dev/null 2>&1; then
        tmuxx
    elif type tmux >/dev/null 2>&1; then
        if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
            tmux attach && echo "tmux attached session "
        else
            tmux new-session && echo "tmux created new session"
        fi
    fi
fi

## alias
[[ -f ~/dotfiles/.zshrc.alias ]] && source ~/dotfiles/.zshrc.alias

case "${OSTYPE}" in
## Mac
darwin*)
  [ -f ~/.zshrc.osx ] && source ~/.zshrc.osx
  ;;
## Linux
linux*)
  [ -f ~/.zshrc.linux ] && source ~/.zshrc.linux
  ;;
esac
## local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

alias mylist='find `pwd` -maxdepth 1 -mindepth 1 | grep -v "\/\." > mylist'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
