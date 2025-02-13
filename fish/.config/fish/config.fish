if status is-interactive
    # Commands to run in interactive sessions can go here
end

# volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# zoxide
zoxide init fish --cmd cd | source

# direnv
direnv hook fish | source
direnv export fish | source

bind \cf open_project

# alias
alias n="nvim"
alias y="yazi"
alias z="zellij"
alias lg="lazygit"
alias zup="sudo zypper up"
alias zi="sudo zypper in"
