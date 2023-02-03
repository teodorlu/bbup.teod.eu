#!/usr/bin/env bash

# This installer sets up Babashka and Babashka/bbin without homebrew.
#
# I hope it'll work adequatly on common Linux distribuitions, and Mac. Mac users
# also have the Homebrew option. This installer does /not/ try to install with
# homebrew.

# Defer to default "babashka manual install"
bash <(curl https://raw.githubusercontent.com/babashka/babashka/master/install)
