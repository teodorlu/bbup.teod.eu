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
RUN echo '# source bbup.txt' >> bbup.txt
RUN echo '# /root/.babashka/bbin/bin/bbin' >> bbup.txt

# Now you can can run
#
#   eval $(cat bbup.txt)
#
# to simulate an install.

RUN cat bbup.txt

# Run the installer
RUN bash -c "source bbup.txt"

# Add bbin folder to PATH
#
# Note: $HOME is not set when the Dockerfile runs, but will be /root when you start a terminal.
ENV PATH="/root/.babashka/bbin/bin:$PATH"

# Trigger bbin self-install
RUN bbin -h

# Try install a script
RUN bbin install io.github.teodorlu/neil-quickadd --latest-sha

# yesss
