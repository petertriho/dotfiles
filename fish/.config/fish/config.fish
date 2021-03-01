set -g fish_user_paths "$HOME/.local/bin" $fish_user_paths

test -e /usr/local/opt/asdf/asdf.fish; and \
    source /usr/local/opt/asdf/asdf.fish

set -gx EDITOR nvim
set -gx PROJECT_PATHS $HOME/Documents/GitHub $HOME/Documents/Projects

set -gx COMPOSE_DOCKER_CLI_BUILD 1

set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"

if status is-interactive
    test -e {$HOME}/.iterm2_shell_integration.fish; and \
        source {$HOME}/.iterm2_shell_integration.fish

    starship init fish | source

    set -gx FZF_DEFAULT_COMMAND \
       "rg" \
       "--files" \
       "--follow" \
       "--no-ignore-vcs" \
       "--hidden" \
       "--glob '!{.git/*,.venv/*,__pycache__/*,node_modules/*,build/*,dist/*}'"
    set -gx FZF_DEFAULT_OPTS \
       "--exact" \
       "--border" \
       "--cycle"  \
       "--reverse" \
       "--height '80%'" \
       "--bind 'alt-j:preview-down,alt-k:preview-up,alt-a:select-all,alt-d:deselect-all'" \
       "--color=dark" \
       "--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe" \
       "--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef"
    set -gx FORGIT_FZF_DEFAULT_OPTS $FORGIT_FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS
    set -g fzf_fd_opts --hidden --exclude=.git
end
