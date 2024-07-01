set dotenv-load

# Run container, detaching (daemonize) and removing container once stopped. Good for dev.
run-rm:
    docker run -d --rm --env-file .env -p 42031:42031 --name ditto-stack ditto-stack

# Run container, detaching (daemonize)
run:
    docker run -d --env-file .env -p 42031:42031 --name ditto-stack ditto-stack

# Run container, interactive mode
run-it:
    docker run --env-file .env -it -p 42031:42031 --name ditto-stack ditto-stack

logs:
    docker logs -f ditto-stack

stop:
    docker stop ditto-stack

# copy .env.example to .env and edit it to your needs
dotenv:
    cp .env.example .env

# Build the docker image
build:
    docker build -t ditto-stack .