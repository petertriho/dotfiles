function xfish --wraps fish --description "Fish (x86)"
    # https://github.com/asdf-vm/asdf/issues/1082 issue with tool versions
    if ! test -z (asdf current nodejs 2>&1 | grep "$HOME/.tool-versions")
        set -x ASDF_NODEJS_VERSION (grep "nodejs" "$HOME/.tool-versions-x86" | sed "s/nodejs *\(.*\)/\1/")
    end
    if ! test -z (asdf current python 2>&1 | grep "$HOME/.tool-versions")
        set -x ASDF_PYTHON_VERSION (grep "python" "$HOME/.tool-versions-x86" | sed "s/python *\(.*\)/\1/")
    end

    arch -x86_64 \
        -e ASDF_DATA_DIR="$HOME/.asdf_x86" \
        -e ASDF_DEFAULT_TOOL_VERSIONS_FILENAME="$HOME/.tool-versions-x86" \
        -e ASDF_NPM_DEFAULT_PACKAGES_FILE="$HOME/.default-npm-packages-x86" \
        -e ASDF_PYTHON_DEFAULT_PACKAGES_FILE="$HOME/.default-python-packages-x86" \
        -e DOCKER_DEFAULT_PLATFORM=linux/amd64 \
        /usr/local/bin/fish $argv
end
