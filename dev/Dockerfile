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

# Trigger bbin self-install
RUN /root/.babashka/bbin/bin/bbin -h

# Try install a script
RUN /root/.babashka/bbin/bin/bbin install io.github.teodorlu/neil-quickadd --latest-sha

# yesss
