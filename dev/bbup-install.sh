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
    local dry_run="$1"
    if [[ -z "$dry_run" ]]; then
        # Defer to default "babashka manual install"
        bash <(curl -s https://raw.githubusercontent.com/babashka/babashka/master/install)
    else
       # dry run
       echo "Would run:" "bash <(curl https://raw.githubusercontent.com/babashka/babashka/master/install)"
    fi
}

install_bbin() {
    local dry_run="$1"
    if [[ -z "$dry_run" ]]; then
        # TODO get version first, then download that version
        mkdir -p ~/.babashka/bbin/bin && curl -o- -L https://raw.githubusercontent.com/babashka/bbin/v0.1.2/bbin > ~/.babashka/bbin/bin/bbin && chmod +x ~/.babashka/bbin/bin/bbin
        # TODO sanely add to PATH -- check first if we need to.
        # if bbin path is not on PATH
        #   if shell is bash
        #       ...
        #   else if shell is fish
        #       ...
        #   end
        # end
        # From bbin install instructions:
        #   echo 'export PATH="$PATH:$HOME/.babashka/bbin/bin"' >> ~/.$(basename $SHELL)rc && exec $SHELL
        #
        # We need to add $HOME/.babashka/bbin/bin to PATH!
    else
        # dry run
        echo "Would run:" "mkdir -p ~/.babashka/bbin/bin && curl -o- -L https://raw.githubusercontent.com/babashka/bbin/v0.1.2/bbin > ~/.babashka/bbin/bin/bbin && chmod +x ~/.babashka/bbin/bin/bbin"

        # do we need to add the folder to path?
        # let's check
        # TODO I think this is bash-only functionality, not Posix SH.

        if [[ ":$PATH:" == *":$HOME/.babashka/bbin/bin:"* ]]; then
            echo "Your path is correctly set"
                echo "Found \"$HOME/.babashka/bbin/bin\" on PATH, no changes required."
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
    fi
}

# Just pass args into subcommands
install_babashka "$@"
install_bbin "$@"
