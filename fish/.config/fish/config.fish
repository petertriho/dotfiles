fish_add_path $HOME/.local/bin

switch (uname)
    case Linux
        set -gx HOMEBREW_PREFIX /home/linuxbrew/.linuxbrew
        set -gx HOMEBREW_CELLAR $HOMEBREW_PREFIX/Cellar
        set -gx HOMEBREW_REPOSITORY $HOMEBREW_PREFIX/Homebrew
        set -gx MANPATH "$HOMEBREW_PREFIX/share/man:$MANPATH"
        set -gx INFOPATH "$HOMEBREW_PREFIX/share/info:$INFOPATH"

        fish_add_path $HOMEBREW_PREFIX/sbin
        fish_add_path $HOMEBREW_PREFIX/bin

        test -e ~/.asdf/asdf.fish; and source ~/.asdf/asdf.fish

        if test -e /proc/version && test -n (string match -r "microsoft" (cat "/proc/version"))
            set -gx FORGIT_COPY_CMD "win32yank.exe -i"
        end
    case Darwin
        test -e /usr/local/opt/asdf/asdf.fish; and source /usr/local/opt/asdf/asdf.fish

        set -gx LDFLAGS -L/usr/local/opt/openssl/lib
        set -gx CPPFLAGS -I/usr/local/opt/openssl/include

        test -e $HOME/.iterm2_shell_integration.fish; and source $HOME/.iterm2_shell_integration.fish
end

fish_add_path -mP "$YARN_GLOBAL_BIN"

set -gx EDITOR nvim

set -gx PROJECT_PATHS \
    $HOME/Documents/Projects \
    $HOME/Documents/GitHub \
    $HOME/Documents/GitLab

set -gx COMPOSE_DOCKER_CLI_BUILD 1

set -gx PRETTIERD_DEFAULT_CONFIG $HOME/.config/format-lint/.prettierrc.json

if status is-interactive
    if command -v starship &>/dev/null
        starship init fish | source
    end

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

    set -gx NNN_OPTS cGH

    set BLK 04
    set CHR 04
    set DIR 04
    set EXE 00
    set REG 00
    set HARDLINK 00
    set SYMLINK 06
    set MISSING 00
    set ORPHAN 01
    set FIFO 0F
    set SOCK 0F
    set OTHER 02
    set -gx NNN_FCOLORS "$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
end
