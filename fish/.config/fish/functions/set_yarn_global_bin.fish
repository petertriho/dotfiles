function set_yarn_global_bin --description "Set YARN_GLOBAL_BIN universal variable"
    set -Ux YARN_GLOBAL_BIN (yarn global bin)
end
