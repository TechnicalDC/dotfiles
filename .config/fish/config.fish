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
set --export PATH  $PATH /mnt/c/Progress/OpenEdge/bin/
set --export JAVA_HOME /usr/lib/jvm/jdk-11.0.26-oracle-x64
set --export DLC   /mnt/c/Progress/OpenEdge
set --export QT_QUICK_CONTROLS_STYLE Basic
set --export FZF_DEFAULT_OPTS "--layout=reverse
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
source "$HOME/.cache/wal/colors-fzf.fish"
source "$HOME/.config/nvim/extras/mini.fish"

zoxide init fish | source

function fish_prompt
    set -l dir (basename (prompt_pwd))
    set -l branch (fish_git_prompt)
	 echo $dir $branch "󰘧 "
end

function fish_mode_prompt
end
