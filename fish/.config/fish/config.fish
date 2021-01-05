starship init fish | source

if status is-interactive
    test -e {$HOME}/.iterm2_shell_integration.fish; and \
        source {$HOME}/.iterm2_shell_integration.fish

    set -g fish_greeting
    set -g fish_key_bindings fish_hybrid_key_bindings

    set -g fish_cursor_default block
    set -g fish_cursor_insert line
    set -g fish_cursor_replace_one underscore
    set -g fish_cursor_visual block

    set -gx EDITOR nvim
    set -gx PROJECT_PATHS $HOME/Documents/GitHub $HOME/Documents/Projects

    set -gx FZF_DEFAULT_COMMAND \
        "rg \
         --files \
         --follow \
         --no-ignore-vcs \
         --hidden \
         --glob '!{.git/*,.env/*,__pycache__/*,node_modules/*}'
        "
    set -gx FZF_DEFAULT_OPTS \
        "--exact 
         --border \
         --cycle  \
         --reverse \
         --height '80%' \
         --bind 'alt-j:preview-down,alt-k:preview-up,alt-a:select-all,alt-d:deselect-all'
        "
    set -gx FORGIT_FZF_DEFAULT_OPTS $FORGIT_FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS
end

test -e /usr/local/opt/asdf/asdf.fish; and \
    source /usr/local/opt/asdf/asdf.fish

set -gx COMPOSE_DOCKER_CLI_BUILD 1

set -g fish_user_paths "$HOME/.local/bin" $fish_user_paths
