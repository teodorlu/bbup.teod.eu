# Developing

You can use `--dry-run` to run bbup without installing anything:

    $ bash install.sh --dry-run

Try a "real install" with the Dockerfile in this folder:

    $ docker build -f big.dockerfile -t tmp . && docker run --rm -it tmp
    
    
