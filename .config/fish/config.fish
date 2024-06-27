# Exports {{{
set --export SHELL /usr/bin/fish
set --export ANDROID_HOME $XDG_DATA_HOME/android
set --export EDITOR "nvim"
set --export VISUAL "nvim"
# set --export TERMINAL "st"
set --export PAGER "less"
set --export PATH  $PATH $HOME/.scripts/
set --export PATH  $PATH $HOME/.local/bin/
set --export PATH  $PATH $HOME/.cargo/bin/
set --export FZF_DEFAULT_OPTS "--layout=reverse
--preview='batcat {} --color always --style=plain'
--margin=10%
--border=rounded
--height=100%
--prompt=' '
--pointer='>>'"
set --export _ZO_FZF_OPTS "--layout=reverse
--margin=10%
--border=rounded
--height=100%
--prompt=' '
--pointer='>>'"
#}}}

set fish_greeting

fish_vi_key_bindings

source "$HOME/.config/fish/abbreviations.fish"

# Custom header
zoxide init fish | source
starship init fish | source
