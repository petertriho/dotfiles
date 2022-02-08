function set_abbr --description "Set abbr(eviations)"
    for abbreviation in (abbr -l)
        abbr -e $abbreviation
    end

    abbr -a -U -- d    docker
    abbr -a -U -- dc   'docker compose'
    abbr -a -U -- dcd  'docker compose down --remove-orphans'
    abbr -a -U -- dcl  'docker compose logs -f -t --tail=100'
    abbr -a -U -- dcu  'docker compose up -d'
    abbr -a -U -- g    git
    abbr -a -U -- gaa  'git add --all'
    abbr -a -U -- gb   'git branch'
    abbr -a -U -- gbd  'git branch -D'
    abbr -a -U -- gc   'git commit'
    abbr -a -U -- gcb  'git_clone_bare'
    abbr -a -U -- gcl  'git clone'
    abbr -a -U -- gco  'git checkout'
    abbr -a -U -- gcob 'git checkout -b'
    abbr -a -U -- gf   'git fetch'
    abbr -a -U -- gm   'git merge'
    abbr -a -U -- gpl  'git pull'
    abbr -a -U -- gplo 'git pull origin'
    abbr -a -U -- gps  'git push'
    abbr -a -U -- grb  'git rebase'
    abbr -a -U -- grba 'git rebase --abort'
    abbr -a -U -- grbc 'git rebase --continue'
    abbr -a -U -- grbi 'git rebase --interactive'
    abbr -a -U -- grs  'git reset'
    abbr -a -U -- grsh 'git reset --hard'
    abbr -a -U -- grss 'git reset --soft'
    abbr -a -U -- gs   'git status'
    abbr -a -U -- gst  'git stash'
    abbr -a -U -- gsta 'git stash apply'
    abbr -a -U -- gstp 'git stash pop'
    abbr -a -U -- gsw  'git switch'
    abbr -a -U -- gw   'git worktree'
    abbr -a -U -- k    kubectl
    abbr -a -U -- ll   'ls -la'
    abbr -a -U -- mk   minikube
    abbr -a -U -- pv   'python -m venv .venv'
    abbr -a -U -- rmf  'rm -rf'
    abbr -a -U -- sv   'source .venv/bin/activate.fish'
    abbr -a -U -- t    tmux
    abbr -a -U -- ta   'tmux attach-session -t'
    abbr -a -U -- task ./Taskfile
    abbr -a -U -- tf   terraform
    abbr -a -U -- tk   'tmux kill-session -t'
    abbr -a -U -- tl   'tmux list-sessions'
    abbr -a -U -- tn   'tmux new-session -s'
end
