# Developing

## Files

- `exN.dockerfile` -- different dockerfiles for testing
- `dev-install.sh` -- A copy of the toplevel install script, for development.

    Why? Docker is not allowed to copy files from the parent directory under
    build. I choose to copy some files rather than redo the repo structure to
    please docker.

## Usage

You can use `--dry-run` to run bbup without installing anything:

    $ bash install.sh --dry-run

Try a "real install" with the Dockerfile in this folder:

    $ docker build -f ex1.dockerfile -t tmp . && docker run --rm -it tmp

There are multiple dockerfiles.

| file           | does                                                                            |
|----------------|---------------------------------------------------------------------------------|
| ex1.dockerfile | Installs dependencies, installs bbup from web, sets up bbin and uses it         |
| ex2.dockerfile | Installs dependencies, prepares bbup.txt for install from web (source bbup.txt) |


