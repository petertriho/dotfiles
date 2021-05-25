fish_add_path $HOME/.local/bin

switch (uname)
   case Linux
      set -gx HOMEBREW_PREFIX /home/linuxbrew/.linuxbrew
      set -gx HOMEBREW_CELLAR $HOMEBREW_PREFIX/Cellar
      set -gx HOMEBREW_REPOSITORY $HOMEBREW_PREFIX/Homebrew
      set -gx MANPATH $HOMEBREW_PREFIX/share/man $MANPATH
      set -gx INFOPATH $HOMEBREW_PREFIX/share/info $INFOPATH

      fish_add_path $HOMEBREW_PREFIX/sbin
      fish_add_path $HOMEBREW_PREFIX/bin

      test -e /opt/asdf-vm/asdf.fish; and \
         source /opt/asdf-vm/asdf.fish

      set -g FORGIT_COPY_CMD 'win32yank.exe -i'
   case Darwin
      test -e /usr/local/opt/asdf/asdf.fish; and \
         source /usr/local/opt/asdf/asdf.fish

      test -e {$HOME}/.iterm2_shell_integration.fish; and \
         source {$HOME}/.iterm2_shell_integration.fish
end

set -gx EDITOR nvim
set -gx PROJECT_PATHS $HOME/Documents/GitHub $HOME/Documents/Projects

set -gx COMPOSE_DOCKER_CLI_BUILD 1

set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"

if status is-interactive
   starship init fish | source

   set -gx FZF_DEFAULT_COMMAND \
      "fd" \
      "--type file" \
      "--color always" \
      "--follow" \
      "--hidden" \
      "--exclude .git"
   set -gx FZF_DEFAULT_OPTS \
      "--ansi" \
      "--exact" \
      "--border" \
      "--cycle"  \
      "--reverse" \
      "--height '80%'" \
      "--bind '?:toggle-preview'" \
      "--bind 'ctrl-space:toggle-preview'" \
      "--bind 'ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up'" \
      "--bind 'alt-j:preview-down,alt-k:preview-up'" \
      "--bind 'alt-a:select-all,alt-d:deselect-all'" \
      "--color=dark" \
      "--color=fg:-1,bg:-1,hl:#bb9af7,fg+:#c0caf5,bg+:#292e42,hl+:#414868" \
      "--color=info:#9ece6a,prompt:#7aa2f7,pointer:#f7768e,marker:#e0af68,spinner:#7dcfff,header:#7dcfff"
   set -gx FORGIT_FZF_DEFAULT_OPTS $FORGIT_FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS

   set -gx FORGIT_GI_REPO_REMOTE https://github.com/dvcs/gitignore
   set -gx FORGIT_GI_REPO_LOCAL $HOME/.cache/forgit/gi/repos/dvcs/gitignore
   set -gx FORGIT_GI_TEMPLATES $FORGIT_GI_REPO_LOCAL/templates

   set fzf_fd_opts --hidden --exclude .git

   bind \e\cf __fzf_search_current_dir
   bind \e\cr __fzf_search_history
   bind \e\cv $fzf_search_vars_cmd
   bind \e\cl __fzf_search_git_log
   bind \e\cs __fzf_search_git_status

   if test "$fish_key_bindings" = fish_vi_key_bindings -o "$fish_key_bindings" = fish_hybrid_key_bindings
      bind --mode insert \e\cf __fzf_search_current_dir
      bind --mode insert \e\cr __fzf_search_history
      bind --mode insert \e\cv $fzf_search_vars_cmd
      bind --mode insert \e\cl __fzf_search_git_log
      bind --mode insert \e\cs __fzf_search_git_status
   end
end
