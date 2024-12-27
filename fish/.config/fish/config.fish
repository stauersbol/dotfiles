if status is-interactive
    # Commands to run in interactive sessions can go here
end

# cargo
source "$HOME/.cargo/env.fish"

# volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# zoxide
zoxide init fish | source

# direnv
direnv hook fish | source
direnv export fish | source
