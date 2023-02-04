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

    ## draft
    #
    # bbup detected that you are running $SHELL
    #
    # Babashka scripts will be installed into
    #
    #   "$HOME/.babashka/bbin/bin"
    #
    # Would you like to add
    #
    #   export PATH="$HOME/.babashka/bbin/bin:$PATH"
    #
    # to your bashrc/zshrc (Y/n)?

    # If we cannot detect shell (eg fish):
    #
    # bbup detected that you are running $SHELL
    #
    # bbup does not support automatic installation for $SHELL
    #
    # please install yourself!

    ########################################
    #
    #  CHECK SHELL

    if [[ ":$PATH:" == *":$HOME/.babashka/bbin/bin:"* ]]; then
        # do nothing
        echo -n ""
    else
        shell_name=$(basename $SHELL)
        echo "bbup detected that you are running ${shell_name}."

        # Template confirmation text:
        #
        #     Packages (1) archlinux-keyring-20230130-1
        #
        #     Total Download Size:   1.12 MiB
        #     Total Installed Size:  1.60 MiB
        #     Net Upgrade Size:      0.00 MiB
        #
        #     :: Proceed with installation? [Y/n]

        if [[ "$shell_name" == "bash" ]]; then
            modification='export PATH="$HOME/.babashka/bbin/bin"'

            echo "bbup has detected that you are running $shell_name"
            echo "Would you like to add"
            echo ""
            echo "    $modification"
            echo ""
            read -p "to $HOME/.bashrc? [Y/n] " modify

            if [[ "$modify" == "Y" || "$modify" == "" ]]; then
                echo "$modification" >> "$HOME/.bashrc"
            fi
        elif [[ "$shell_name" == "zsh" ]]; then
            modification='export PATH="$HOME/.babashka/bbin/bin"'

            echo "bbup has detected that you are running $shell_name"
            echo "Would you like to add"
            echo ""
            echo "    $modification"
            echo ""
            read -p "to $HOME/.zshrc? [Y/n] " modify

            if [[ "$modify" == "Y" || "$modify" == "" ]]; then
                echo "$modification" >> "$HOME/.zshrc"
            fi
        else
            echo "Cannot decide what to do with your shell: $SHELL"
            echo "Please add \"$HOME/.babashka/bbin/bin\" to PATH manually."
        fi
    fi
}

# Just pass args into subcommands
install_babashka "$@"
install_bbin "$@"
