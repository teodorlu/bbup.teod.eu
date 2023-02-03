#!/usr/bin/env bash

# This installer sets up Babashka and Babashka/bbin without homebrew.
#
# I hope it'll work adequatly on common Linux distribuitions, and Mac. Mac users
# also have the Homebrew option. This installer does /not/ try to install with
# homebrew.

install_babashka() {
    local dry_run="$1"
    # Defer to default "babashka manual install"
    bash <(curl https://raw.githubusercontent.com/babashka/babashka/master/install)
}

install_bbin() {
    local dry_run="$1"
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
}

install_babashka
install_bbin
