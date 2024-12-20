if status is-interactive
    # Commands to run in interactive sessions can go here
    source "$HOME/.cargo/env.fish"
end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
