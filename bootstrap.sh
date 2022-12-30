#!/usr/bin/env bash

set -eo pipefail

PYTHON_VERSION=3.10
NODEJS_VERSION=16

DOTFILES_DIR=$(
              cd "$(dirname "$0")"
                                    pwd -P
)
OS=$(uname -s | tr "[:upper:]" "[:lower:]")
ARCH=$(uname -m)

function install_homebrew {
    case "$OS" in
        linux)
            # assume debian/ubuntu
            sudo apt-get install build-essential procps curl file git
            HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
            ;;
        darwin)
            case "$ARCH" in
                arm64)
                    HOMEBREW_PREFIX=/opt/homebrew
                    ;;
                x86_64)
                    HOMEBREW_PREFIX=/usr/local
                    ;;
            esac
            ;;
        *)
            echo "Homebrew does not support $OS"
            exit 1
            ;;
    esac

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    eval "$("$HOMEBREW_PREFIX/bin/brew" shellenv)"

    brew bundle install --file "$DOTFILES_DIR/bootstrap/homebrew/Brewfile"

    if [[ $OS == "darwin" ]]; then
        brew bundle install --file "$DOTFILES_DIR/bootstrap/homebrew/Brewfile-macos"
    fi
}

function install_asdf {
    brew install asdf
    source "$HOMEBREW_PREFIX/opt/asdf/asdf.sh"

    asdf plugin add direnv
    asdf direnv setup --shell fish --version latest
    asdf global direnv latest

    asdf plugin add golang
    asdf install golang latest
    asdf global golang latest

    asdf plugin add nodejs
    asdf install nodejs latest:$NODEJS_VERSION
    asdf global nodejs latest:$NODEJS_VERSION

    asdf plugin add python
    asdf install python latest:$PYTHON_VERSION
    asdf global python latest:$PYTHON_VERSION

    asdf plugin add rust
    asdf install rust stable
    asdf global rust stable

    asdf reshim
}

function install_plugin_managers {
    # Fish - fisher
    fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

    # Neovim - packer
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    # Tmux - tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

function setup_misc {
    FISH_PATH=$(which fish)
    echo "$FISH_PATH" | sudo tee -a /etc/shells
    chsh -s "$FISH_PATH"

    gh auth login
    gh extension install dlvhdr/gh-dash

    rm ~/.config/gh/config.yml

    (cd "$DOTFILES_DIR" && git config remote.origin.url git@github.com:petertriho/dotfiles.git)

    (cd "$DOTFILES_DIR" && stow --no-folding -t ~ */)
}

function main {
    install_homebrew
    setup_misc

    install_asdf
    install_plugin_managers
}

main
