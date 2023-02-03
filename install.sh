#!/usr/bin/env bash

# This installer sets up Babashka and Babashka/bbin without homebrew.
#
# I hope it'll work adequatly on common Linux distribuitions, and Mac. Mac users
# also have the Homebrew option. This installer does /not/ try to install with
# homebrew.

# Defer to default "babashka manual install"
bash <(curl https://raw.githubusercontent.com/babashka/babashka/master/install)

# TODO get version first, then download that version
mkdir -p ~/.babashka/bbin/bin && curl -o- -L https://raw.githubusercontent.com/babashka/bbin/v0.1.2/bbin > ~/.babashka/bbin/bin/bbin && chmod +x ~/.babashka/bbin/bin/bbin
# TODO sanely add to PATH -- check first if we need to.
