# Exports {{{
set --export SHELL /usr/bin/fish
set --export ANDROID_HOME $XDG_DATA_HOME/android
set --export EDITOR "nvim"
set --export VISUAL "nvim"
set --export TERMINAL "ghostty"
set --export PAGER "less"
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
--pointer='>>'
--border rounded
--color=bg+:#111111,bg:#111111,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a"

set --export _ZO_FZF_OPTS "--layout=reverse
--margin=10%
--height=100%
--prompt=' '
--pointer='>>'
--color=bg+:#111111,bg:#111111,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a"
#}}}

set fish_greeting

fish_vi_key_bindings

source "$HOME/.config/fish/abbreviations.fish"

# Custom header
zoxide init fish | source
starship init fish | source
#colorscript -e panes
