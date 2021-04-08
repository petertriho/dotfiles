fish_add_path $HOME/.local/bin

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
      "--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe" \
      "--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef"
   set -gx FORGIT_FZF_DEFAULT_OPTS $FORGIT_FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS
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
