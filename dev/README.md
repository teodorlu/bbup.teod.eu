# Developing

Dry run on your own machine:

    bash install.sh --dry-run

Try a "real install" with Docker:

    $ docker build -t tmp . && docker run --rm -it tmp
    # then, from inside the docker container
    $ curl --proto '=https' --tlsv1.2 -sSf https://bbup.teod.eu/install.sh | sh
