set --export SHELL /usr/bin/fish
set --export ANDROID_HOME $XDG_DATA_HOME/android
set --export EDITOR "nvim"
set --export VISUAL "nvim"
set --export PATH  $PATH $HOME/.scripts/
set --export TERMINAL "st"
set --export FZF_DEFAULT_OPTS "--layout=reverse
	--border rounded
	--prompt=' '
	--pointer='>>'"

set fish_greeting

fish_vi_key_bindings

source "$HOME/.config/fish/abbreviations.fish"

# Custom header
fm6000 -c $(shuf -e red green yellow blue magenta | head -n 1)
