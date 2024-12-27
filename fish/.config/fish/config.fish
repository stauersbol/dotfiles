if status is-interactive
    # Commands to run in interactive sessions can go here
end

# cargo
source "$HOME/.cargo/env.fish"

# volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
