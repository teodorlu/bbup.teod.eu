FROM archlinux

RUN pacman-key --init
RUN pacman -Syuu --noconfirm

# Install implicit dependencies:

RUN pacman -S which --noconfirm

# bbin crashes because java is not found.

RUN pacman -S jdk-openjdk --noconfirm

# bbin crashes because git is not found.

RUN pacman -S git --noconfirm

# (is java supposed to be required?)

RUN echo "curl --proto '=https' --tlsv1.2 -sSf https://bbup.teod.eu/install.sh | sh" > bbup.txt
