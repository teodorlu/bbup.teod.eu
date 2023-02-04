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

COPY bbup-install.sh run.sh

RUN echo "cat run.sh | sh" > bbup.txt
RUN echo '# source bbup.txt' >> bbup.txt
RUN echo '# /root/.babashka/bbin/bin/bbin' >> bbup.txt

RUN pacman -S zsh vim --noconfirm
RUN chsh -s $(which sh)

RUN echo "echo from bash" >> /root/.bashrc
RUN echo "echo from zsh" >> /root/.zshrc

# this is really hard to test.
