function afish --wraps fish --description "Fish (ARM)"
    arch -arm64 /opt/homebrew/bin/fish \
        --init-command "set -e ASDF_DEFAULT_TOOL_VERSIONS_FILENAME; set -e ASDF_DATA_DIR; set -e ASDF_PYTHON_VERSION" \
        $argv
end
