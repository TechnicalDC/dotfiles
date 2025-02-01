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
abbr gS "git status"
abbr gc "git commit -m"
abbr gp "git push"
abbr gP "git pull"

alias di="sudo dnf install"
alias du="sudo dnf update"
alias dU="sudo dnf upgrade"
alias ds="sudo dnf search"
alias dr="sudo dnf remove"
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias all='exa -al --color=always -h --icons --tree --level=1'
alias exa="exa --color=always --icons"
alias la='exa -a --color=always --icons'
alias ls="exa --color=always --icons"
alias ll='exa -l --color=always -h --icons --tree --level=1'
alias ll2='exa -l --color=always -h --icons --tree --level=2'
alias ll3='exa -l --color=always -h --icons --tree --level=3'
alias zf='z $(fd -t d | fzf --preview "ls -l {}")'

if test -f $(which bat)
   alias cat="bat"
end

if test -f $(which pokeget)
   alias ff='pokeget random --hide-name | fastfetch --file-raw -'
end
