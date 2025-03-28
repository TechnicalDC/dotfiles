# Exports {{{
set --export SHELL /usr/bin/fish
set --export ANDROID_HOME $XDG_DATA_HOME/android
set --export EDITOR "nvim"
set --export VISUAL "nvim"
set --export TERMINAL "kitty"
set --export PGER "less"
set --export MANPAGER "nvim +Man!"
set --export BROWSER "qutebrowser"
set --export THEME "catppuccin"
set --export PATH  $PATH $HOME/.scripts/
set --export PATH  $PATH $HOME/.local/bin/
set --export PATH  $PATH $HOME/.cargo/bin/
set --export PATH  $PATH $HOME/go/bin/
set --export QT_QUICK_CONTROLS_STYLE Basic
set --export FZF_DEFAULT_OPTS "--layout=reverse
--margin=10%
--height=100%
--prompt=' '
--pointer=''
--info=hidden
--highlight-line
--ansi
--preview-label ' preview '
--border rounded
--border-label=' fzf ' --border-label-pos='0' --preview-window='border-rounded'
--scrollbar='│'"

set --export _ZO_FZF_OPTS "--layout=reverse
--margin=10%
--height=100%
--prompt=' '
--pointer=''
--info=hidden
--highlight-line
--ansi
--preview-label ' preview '
--preview 'eza -lA --color=always {2}'
--border rounded
--border-label=' fzf ' --border-label-pos='0' --preview-window='border-rounded'
--scrollbar='│'"
#}}}

set fish_greeting

fish_vi_key_bindings

source "$HOME/.config/fish/abbreviations.fish"
source "$HOME/.cache/wal/colors-fzf.fish"

# Custom header
zoxide init fish | source
starship init fish | source
#colorscript -e panes
