function set_abbr --description "Set abbr(eviations)"
    for abbreviation in (abbr -l)
        abbr -e $abbreviation
    end

    abbr -a -U -- dc docker-compose
    abbr -a -U -- dcl 'docker-compose logs -f -t --tail=100'
    abbr -a -U -- dcu 'docker-compose up -d'
    abbr -a -U -- do docker
    abbr -a -U -- g git
    abbr -a -U -- gc 'git commit'
    abbr -a -U -- gco 'git checkout'
    abbr -a -U -- gf 'git fetch'
    abbr -a -U -- gm 'git merge'
    abbr -a -U -- gp 'git pull'
    abbr -a -U -- gps 'git push'
    abbr -a -U -- gs 'git status'
    abbr -a -U -- gst 'git stash'
    abbr -a -U -- gsw 'git switch'
    abbr -a -U -- ll 'ls -la'
    abbr -a -U -- t tmux
    abbr -a -U -- ta 'tmux attach-session -t'
    abbr -a -U -- tk 'tmux kill-session -t'
    abbr -a -U -- tl 'tmux list-sessions'
    abbr -a -U -- tn 'tmux new-session -s'
end
