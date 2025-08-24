# Exports {{{
set --export SHELL /usr/bin/fish
set --export ANDROID_HOME $XDG_DATA_HOME/android
set --export EDITOR "nvim"
set --export VISUAL "nvim"
set --export TERMINAL "alacritty"
set --export PAGER "less"
set --export MANPAGER "nvim +Man!"
set --export BROWSER "qutebrowser"
set --export THEME "catppuccin"
set --export PATH  $PATH $HOME/.scripts/
set --export PATH  $PATH $HOME/.local/bin/
set --export PATH  $PATH $HOME/.cargo/bin/
set --export PATH  $PATH $HOME/go/bin/
set --export PATH  $PATH /mnt/c/Progress/OpenEdge/bin/
set --export JAVA_HOME /usr/lib/jvm/java-21-openjdk
set --export DLC   /mnt/c/Progress/OpenEdge
set --export QT_QUICK_CONTROLS_STYLE Basic
set --export FZF_DEFAULT_OPTS "--layout=reverse
--height=60%
--prompt=' '
--pointer=''
--info=hidden
--highlight-line
--ansi
--border double"

set --export _ZO_FZF_OPTS "--layout=reverse
--height=60%
--prompt=' '
--pointer=''
--info=hidden
--highlight-line
--ansi
--border double"
#}}}

set fish_greeting
# Set the cursor shapes for the different vi modes.
set fish_cursor_default     block blink
set fish_cursor_insert      block blink
set fish_cursor_replace_one block blink
set fish_cursor_visual      block
set fish_color_command      green
set fish_pager_color_prefix green
set fish_pager_color_selected_background -r

fish_vi_key_bindings

source "$HOME/.config/fish/abbreviations.fish"
source "$HOME/.config/nvim/extras/mini-fzf.fish"
source "$HOME/.config/nvim/extras/mini.fish"

zoxide init fish | source

function fish_prompt
    set -l dir (string trim (basename (prompt_pwd)))
    set -l branch (string trim (fish_git_prompt))
	 echo (set_color $foreground)$dir (set_color $comment)$branch(set_color normal) "󰘧 "
end

function fish_mode_prompt
end
