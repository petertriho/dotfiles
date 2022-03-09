function xfish --wraps fish --description "Fish (x86)"
    # https://github.com/asdf-vm/asdf/issues/1082 issue with tool versions
    set PYTHON_VERSION (grep "python" "$HOME/.tool-versions-x86" | sed "s/python *\(.*\)/\1/")
    arch -x86_64 /usr/local/bin/fish \
        --init-command "set -x ASDF_DEFAULT_TOOL_VERSIONS_FILENAME $HOME/.tool-versions-x86; set -x ASDF_DATA_DIR $HOME/.asdf_x86; set -x ASDF_PYTHON_VERSION $PYTHON_VERSION" \
        $argv
end
