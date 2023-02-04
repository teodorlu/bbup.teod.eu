# Developing

You can use `--dry-run` to run bbup without installing anything:

    $ bash install.sh --dry-run

Try a "real install" with the Dockerfile in this folder:

    $ docker build -f ex1.dockerfile -t tmp . && docker run --rm -it tmp

There are multiple dockerfiles.

| file           | does                                            |
|----------------|-------------------------------------------------|
| ex1.dockerfile | Installs everything, and tries it out           |
| ex2.dockerfile | Prepares an environment for manual bbup install |
