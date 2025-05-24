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

# Custom header
zoxide init fish | source
# colorscript -e panes

function fish_prompt
    set -l fg_indicator (test $status -eq 0; and echo green; or echo red)
    set -l bg0 "#3d2021"
    set -l bg1 "#282828"
    set -l bg2 "#32302f"
    set -l bg3 "#504945"
    set -l bg_color '#282828'
    set -l fg_color '#D4BE98'
    set -l color (set_color -b $bg1 $fg_color)
    set -l color1 (set_color -b $bg2 $fg_color)
    set -l indicator_color (set_color -b $bg1 $bg3)
    set -l dir (basename (prompt_pwd))
    set -l branch (fish_git_prompt)

	 if test -n "$branch"
		 set branch $branch ' '
	 end

    echo ""
    echo -n -s $indicator_color '█ ' $color $dir $color1 $branch_icon $color $branch ' ' (set_color normal) ' '
end

function fish_mode_prompt
end
