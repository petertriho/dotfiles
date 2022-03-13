switch (uname)
    case Linux
        set -gx HOMEBREW_PREFIX /home/linuxbrew/.linuxbrew
        eval ($HOMEBREW_PREFIX/bin/brew shellenv)

        test -e $HOME/.asdf/asdf.fish; and source $HOME/.asdf/asdf.fish

        if test -e /proc/version && test -n (string match -r "microsoft" (cat "/proc/version"))
            set -gx FORGIT_COPY_CMD "win32yank.exe -i"
        end
    case Darwin
        switch (uname -m):
            case arm64:
                set -gx HOMEBREW_PREFIX /opt/homebrew
            case x86_64:
                set -gx HOMEBREW_PREFIX /usr/local
        end
        eval ($HOMEBREW_PREFIX/bin/brew shellenv)

        test -e $HOMEBREW_PREFIX/opt/asdf/asdf.fish; and source $HOMEBREW_PREFIX/opt/asdf/asdf.fish

        set -gx LDFLAGS -L$HOMEBREW_PREFIX/opt/openssl/lib
        set -gx CPPFLAGS -I$HOMEBREW_PREFIX/opt/openssl/include
end

fish_add_path $HOME/.local/bin
fish_add_path -mP "$YARN_GLOBAL_BIN"

set -gx EDITOR nvim

set -gx PROJECT_PATHS \
    $HOME/Documents/Projects \
    $HOME/Documents/GitHub \
    $HOME/Documents/GitLab

set -gx COMPOSE_DOCKER_CLI_BUILD 1

if command -v starship &>/dev/null
    starship init fish | source
end

if status is-interactive
    set -gx ENHANCD_FILTER fzf

    set -gx FZF_DEFAULT_OPTS \
        --ansi \
        --exact \
        --border \
        --cycle \
        --reverse \
        "--height '80%'" \
        "--bind 'ctrl-space:toggle-preview'" \
        "--bind 'ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up'" \
        "--bind 'alt-a:select-all,alt-d:deselect-all'" \
        "--color=dark" \
        "--color=border:7,fg:-1,bg:-1,hl:5,fg+:7,bg+:8,hl+:5" \
        "--color=info:6,prompt:2,pointer:2,marker:3,spinner:1,header:4"

    set -gx FORGIT_FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS
    set -gx FORGIT_LOG_GRAPH_ENABLE true

    set -g fzf_fd_opts --hidden --exclude .git
    fzf_configure_bindings \
        --directory=\e\cf \
        --git_log=\e\cl \
        --git_status=\e\cs \
        --history=\e\cr \
        --variable=\e\ce

    delta_side_by_side

    if command -v zoxide &>/dev/null
        zoxide init --cmd j fish | source
    end
end
