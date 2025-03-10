# Exports {{{
set --export SHELL /usr/bin/fish
set --export ANDROID_HOME $XDG_DATA_HOME/android
set --export EDITOR "nvim"
set --export VISUAL "nvim"
set --export TERMINAL "ghostty"
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
--scrollbar='│'
--color=fg:#d0d0d0,fg+:#111111,bg:-1,bg+:#2bbac5
--color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#e5c07b
--color=prompt:#61afef,spinner:#af5fff,pointer:#af5fff,header:#87afaf
--color=border:#2bbac5,label:#ef596f,query:#d9d9d9"

set --export _ZO_FZF_OPTS "--layout=reverse
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
--scrollbar='│'
--color=fg:#d0d0d0,fg+:#111111,bg:-1,bg+:#2bbac5
--color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#e5c07b
--color=prompt:#61afef,spinner:#af5fff,pointer:#af5fff,header:#87afaf
--color=border:#2bbac5,label:#ef596f,query:#d9d9d9"
#}}}

set fish_greeting

fish_vi_key_bindings

source "$HOME/.config/fish/abbreviations.fish"

# Custom header
zoxide init fish | source
starship init fish | source
#colorscript -e panes
