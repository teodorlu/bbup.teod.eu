#!/usr/bin/env bash

set -e

# This installer sets up Babashka and Babashka/bbin without homebrew.
#
# I hope it'll work adequatly on common Linux distribuitions, and Mac. Mac users
# also have the Homebrew option. This installer does /not/ try to install with
# homebrew.
#
# Ideally, I would write this script with `#!/usr/bin/env sh` rather than bash.
# But starting with something is better than nothing.

install_babashka() {
    bash <(curl -s https://raw.githubusercontent.com/babashka/babashka/master/install)
}

install_bbin() {
    mkdir -p ~/.babashka/bbin/bin && curl -o- -L https://raw.githubusercontent.com/babashka/bbin/v0.1.2/bbin > ~/.babashka/bbin/bin/bbin && chmod +x ~/.babashka/bbin/bin/bbin

    if [[ ":$PATH:" == *":$HOME/.babashka/bbin/bin:"* ]]; then
        # do nothing
        echo -n ""
    else
        echo ""
        if [[ "$(basename $SHELL)" == "bash" ]]; then
            echo "Would run:" "echo 'export PATH=\"$HOME/.babashka/bbin/bin\" >> $HOME/.bashrc"
        elif [[ "$(basename $SHELL)" == "zsh" ]]; then
            echo "Would run:" "echo 'export PATH=\"$HOME/.babashka/bbin/bin\" >> $HOME/.zshrc"
        else
            echo "Cannot decide what to do with your shell: $SHELL"
            echo "Please add \"$HOME/.babashka/bbin/bin\" to PATH manually."
        fi
    fi
}

# Just pass args into subcommands
install_babashka "$@"
install_bbin "$@"
