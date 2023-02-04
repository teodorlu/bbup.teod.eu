FROM archlinux

RUN pacman-key --init
RUN pacman -Syuu --noconfirm

# Required
RUN pacman -S which jdk-openjdk git --noconfirm

# Optional
RUN pacman -S vim zsh --noconfirm
