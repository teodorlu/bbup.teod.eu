# Developing

## Files

- `exN.dockerfile` -- different dockerfiles for testing
- `Makefile` -- A command for copying `../install.sh` into `./bbup-install.sh`
- `bbup-install.sh` -- A copy of the toplevel install script, for development.

    Why?
    Docker is not allowed to copy files from the parent directory under
    build.

## Usage

First, copy the toplevel `install.sh` in here.

    make

Try a "real install" with the Dockerfile in this folder:

    $ docker build -f ex1.dockerfile -t tmp . && docker run --rm -it tmp

There are multiple dockerfiles.

| file           | does what                                                               |
|----------------|-------------------------------------------------------------------------|
| ex1.dockerfile | Installs dependencies, installs bbup from web, sets up bbin and uses it |
| ex2.dockerfile | Installs dependencies, prepares for local bbup installation             |
| ex3.dockerfile | Like ex2 but with zsh default shell                                     |
| ex4.dockerfile | Dependencies only.                                                      |

