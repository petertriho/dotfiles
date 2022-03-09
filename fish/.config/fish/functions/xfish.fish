function xfish --wraps --description "Fish (x86)"
    set -x ASDF_DEFAULT_TOOL_VERSIONS_FILENAME "$HOME/.tool-versions-x86"
    # https://github.com/asdf-vm/asdf/issues/1082 issue with tool versions
    set -x ASDF_PYTHON_VERSION 3.8.12
    set -x ASDF_DATA_DIR "$HOME/.asdf_x86"
    arch -x86_64 /usr/local/bin/fish $argv
end
