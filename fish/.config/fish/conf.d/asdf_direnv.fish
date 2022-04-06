set CURR_DIRENV_VERSION (grep "direnv" "$HOME/.tool-versions" | sed "s/direnv *\(.*\)/\1/")

set -gx ASDF_DIRENV_BIN "$HOME/.asdf/installs/direnv/$CURR_DIRENV_VERSION/bin/direnv"
test -e $ASDF_DIRENV_BIN; and $ASDF_DIRENV_BIN hook fish | source
