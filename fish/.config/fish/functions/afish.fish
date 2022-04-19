function afish --wraps fish --description "Fish (ARM)"
    arch -arm64 \
        -d ASDF_DATA_DIR \
        -d ASDF_DEFAULT_TOOL_VERSIONS_FILENAME \
        -d ASDF_NODEJS_VERSION \
        -d ASDF_NPM_DEFAULT_PACKAGES_FILE \
        -d ASDF_PYTHON_DEFAULT_PACKAGES_FILE \
        -d ASDF_PYTHON_VERSION \
        -d DOCKER_DEFAULT_PLATFORM \
        -d PATH \
        /opt/homebrew/bin/fish \
        $argv
end
