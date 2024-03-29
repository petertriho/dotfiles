abbr -a -- aa   "arch -arm64"
abbr -a -- af   afish
abbr -a -- ax   "arch -x86_64"
abbr -a -- d    docker
abbr -a -- dc   'docker compose'
abbr -a -- dcd  'docker compose down --remove-orphans'
abbr -a -- dcl  'docker compose logs -f -t --tail=100'
abbr -a -- dcp  'docker compose -p (git_repo_name)'
abbr -a -- dcpd 'docker compose -p (git_repo_name) down --remove-orphans'
abbr -a -- dcpl 'docker compose -p (git_repo_name) logs -f -t --tail=100'
abbr -a -- dcpr 'docker compose -p (git_repo_name) restart'
abbr -a -- dcpu 'docker compose -p (git_repo_name) up -d'
abbr -a -- dcu  'docker compose up -d'
abbr -a -- e    'exa --classify'
abbr -a -- el   'exa --classify --long --header --all --git'
abbr -a -- et   'exa --classify --tree --level=3'
abbr -a -- g    git
abbr -a -- gaa  'git add --all'
abbr -a -- gb   'git branch'
abbr -a -- gbrd 'git branch -D'
abbr -a -- gbs  'git_branch_set_upstream'
abbr -a -- gbu  'git branch --unset-upstream'
abbr -a -- gc   'git commit'
abbr -a -- gcam 'git commit -am'
abbr -a -- gcl  'git clone'
abbr -a -- gclb 'git_clone_bare'
abbr -a -- gco  'git checkout'
abbr -a -- gcob 'git checkout -b'
abbr -a -- gdi  'git diff'
abbr -a -- gdt  'git difftool'
abbr -a -- gf   'git fetch'
abbr -a -- gl   'begin; set -lx GIT_EXTERNAL_DIFF difft; git log -p --ext-diff; end'
abbr -a -- gm   'git merge'
abbr -a -- gma  'git merge --abort'
abbr -a -- gmt  'git mergetool'
abbr -a -- gpl  'git pull'
abbr -a -- gplo 'git pull origin'
abbr -a -- gps  'git push'
abbr -a -- gpsf 'git push --force-with-lease'
abbr -a -- gr   'git rebase'
abbr -a -- gra  'git rebase --abort'
abbr -a -- grbc 'git rebase --continue'
abbr -a -- gri  'git rebase --interactive'
abbr -a -- grf  'git reflog'
abbr -a -- grs  'git reset'
abbr -a -- grs1 "git reset --soft HEAD@{1}"
abbr -a -- grsh 'git reset --hard'
abbr -a -- grss 'git reset --soft'
abbr -a -- gs   'git status'
abbr -a -- gst  'git stash'
abbr -a -- gsta 'git stash apply'
abbr -a -- gstp 'git stash pop'
abbr -a -- gsw  'git switch'
abbr -a -- gw   'git worktree'
abbr -a -- gwa  'git worktree add'
abbr -a -- gwl  'git worktree list'
abbr -a -- gwm  'git worktree move'
abbr -a -- gwr  'git worktree remove'
abbr -a -- k    kubectl
abbr -a -- ll   'ls -la'
abbr -a -- mk   minikube
abbr -a -- pv   'python -m venv .venv'
abbr -a -- rmf  'rm -rf'
abbr -a -- rv   'rm -rf .venv'
abbr -a -- sv   'source .venv/bin/activate.fish'
abbr -a -- t    tmux
abbr -a -- ta   'tmux attach-session -t'
abbr -a -- task ./Taskfile
abbr -a -- tf   terraform
abbr -a -- tk   'tmux kill-session -t'
abbr -a -- tl   'tmux list-sessions'
abbr -a -- tn   'tmux new-session -s'
abbr -a -- xf   xfish
