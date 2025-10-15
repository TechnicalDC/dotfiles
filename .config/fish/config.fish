# Exports {{{
set --export SHELL /usr/bin/fish
set --export ANDROID_HOME $XDG_DATA_HOME/android
set --export EDITOR "nvim"
set --export VISUAL "nvim"
set --export TERMINAL "alacritty"
set --export PAGER "bat"
set --export MANPAGER "bat"
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
set --export Ux FZF_DEFAULT_OPTS "
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
set --export FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS "--layout=reverse
--margin=20%,30%
--prompt='[search] '
--pointer='▌'
--info=hidden
--highlight-line
--ansi"

set --export _ZO_FZF_OPTS "--layout=reverse
--margin=20%,30%
--prompt='[search] '
--pointer='▌'
--info=hidden
--highlight-line
--ansi"
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

# Applying rose-pine theme
fish_config theme choose "Rosé Pine"

function starship_transient_prompt_func
  starship module character
end

zoxide init fish | source
starship init fish | source
enable_transience
