function afish --wraps fish --description "Fish (ARM)"
    set -x ASDF_DEFAULT_TOOL_VERSIONS_FILENAME "$HOME/.tool-versions"
    set -x ASDF_DATA_DIR "$HOME/.asdf"
    arch -arm64 /opt/homebrew/bin/fish $argv
end
