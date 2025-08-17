abbr :q 'exit'
abbr :wq 'exit'
abbr :x 'exit'

abbr vim 'nvim'
abbr vi 'nvim'
abbr v 'nvim'
abbr nv "nvim"
abbr n "nextd"
abbr p "prevd"
abbr lg "lazygit"

abbr ga "git add"
abbr gs "git stage"
abbr gS "git status -s"
abbr gc "git commit -m"
abbr gP "git push"
abbr gp "git pull"

alias di="sudo dnf install"
alias du="sudo dnf update"
alias dU="sudo dnf upgrade"
alias ds="sudo dnf search"
alias dr="sudo dnf remove"
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias zf='z $(fd -t d | fzf --preview "ls -l {}")'

if test -f $(which eza)
   alias all='eza -al --color=always -h --icons --tree --level=1 --group-directories-first'
   alias eza="eza --color=always --icons --group-directories-first"
   alias la='eza -l --color=always -h --icons --tree --level=1 --group-directories-first'
   alias ls="eza --color=always -h --icons --group-directories-first"
   alias ll='eza -l --color=always -h --icons --group-directories-first'
   alias ll1='eza -l --color=always -h --icons --tree --level=1 --group-directories-first'
   alias ll2='eza -l --color=always -h --icons --tree --level=2 --group-directories-first'
   alias ll3='eza -l --color=always -h --icons --tree --level=3 --group-directories-first'
end

if test -f $(which bat)
   alias cat="bat"
end

if test -f $(which pokeget)
   alias ff='pokeget random --hide-name | fastfetch --file-raw -'
end
