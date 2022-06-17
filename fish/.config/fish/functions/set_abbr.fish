function set_abbr --description "Set abbr(eviations)"
    for abbreviation in (abbr -l)
        abbr -e $abbreviation
    end

    abbr -a -U -- aa   "arch -arm64"
    abbr -a -U -- af   afish
    abbr -a -U -- ax   "arch -x86_64"
    abbr -a -U -- d    docker
    abbr -a -U -- dc   'docker compose'
    abbr -a -U -- dcd  'docker compose down --remove-orphans'
    abbr -a -U -- dcl  'docker compose logs -f -t --tail=100'
    abbr -a -U -- dcp  'docker compose -p (git_repo_name)'
    abbr -a -U -- dcpd 'docker compose -p (git_repo_name) down --remove-orphans'
    abbr -a -U -- dcpl 'docker compose -p (git_repo_name) logs -f -t --tail=100'
    abbr -a -U -- dcpr 'docker compose -p (git_repo_name) restart'
    abbr -a -U -- dcpu 'docker compose -p (git_repo_name) up -d'
    abbr -a -U -- dcu  'docker compose up -d'
    abbr -a -U -- e    'exa --classify'
    abbr -a -U -- el   'exa --classify --long --header --all --git'
    abbr -a -U -- et   'exa --classify --tree --level=2'
    abbr -a -U -- g    git
    abbr -a -U -- gaa  'git add --all'
    abbr -a -U -- gb   'git branch'
    abbr -a -U -- gbrd 'git branch -D'
    abbr -a -U -- gbs  'git_branch_set_upstream'
    abbr -a -U -- gbu  'git branch --unset-upstream'
    abbr -a -U -- gc   'git commit'
    abbr -a -U -- gcam 'git commit -am'
    abbr -a -U -- gcb  'git_clone_bare'
    abbr -a -U -- gcl  'git clone'
    abbr -a -U -- gco  'git checkout'
    abbr -a -U -- gcob 'git checkout -b'
    abbr -a -U -- gdi  'git diff'
    abbr -a -U -- gdt  'git difftool'
    abbr -a -U -- gf   'git fetch'
    abbr -a -U -- gl   'begin; set -lx GIT_EXTERNAL_DIFF difft; git log -p --ext-diff; end'
    abbr -a -U -- gm   'git merge'
    abbr -a -U -- gma  'git merge --abort'
    abbr -a -U -- gmt  'git mergetool'
    abbr -a -U -- gpl  'git pull'
    abbr -a -U -- gplo 'git pull origin'
    abbr -a -U -- gps  'git push'
    abbr -a -U -- gpsf 'git push --force-with-lease'
    abbr -a -U -- gr   'git rebase'
    abbr -a -U -- gra  'git rebase --abort'
    abbr -a -U -- grbc 'git rebase --continue'
    abbr -a -U -- gri  'git rebase --interactive'
    abbr -a -U -- grs  'git reset'
    abbr -a -U -- grsh 'git reset --hard'
    abbr -a -U -- grss 'git reset --soft'
    abbr -a -U -- gs   'git status'
    abbr -a -U -- gst  'git stash'
    abbr -a -U -- gsta 'git stash apply'
    abbr -a -U -- gstp 'git stash pop'
    abbr -a -U -- gsw  'git switch'
    abbr -a -U -- gw   'git worktree'
    abbr -a -U -- gwa  'git worktree add'
    abbr -a -U -- gwl  'git worktree list'
    abbr -a -U -- gwm  'git worktree move'
    abbr -a -U -- gwr  'git worktree remove'
    abbr -a -U -- k    kubectl
    abbr -a -U -- ll   'ls -la'
    abbr -a -U -- mk   minikube
    abbr -a -U -- pv   'python -m venv .venv'
    abbr -a -U -- rmf  'rm -rf'
    abbr -a -U -- rv   'rm -rf .venv'
    abbr -a -U -- sv   'source .venv/bin/activate.fish'
    abbr -a -U -- t    tmux
    abbr -a -U -- ta   'tmux attach-session -t'
    abbr -a -U -- task ./Taskfile
    abbr -a -U -- tf   terraform
    abbr -a -U -- tk   'tmux kill-session -t'
    abbr -a -U -- tl   'tmux list-sessions'
    abbr -a -U -- tn   'tmux new-session -s'
    abbr -a -U -- xf   xfish
end
