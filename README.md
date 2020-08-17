# github-actions docker image

[Github Actions](https://github.com/features/actions) docker image.

## Description

This image allows you to deploy a github actions runner in every environment running docker.

I tested it in Kubernetes, Pivotal Cloud Foundry and OpenShift 3.11.

## Usage

Github Actions runner needs at least the token and url obtained from https://github.com/yourorganization/yourproject/settings/actions/add-new-runner so you can execute this command:

```sh
docker run -it -e URL=yourprojecturl -e TOKEN=youcomplextoken -e RUNNER_ALLOW_RUNASROOT=1 --rm --name github-actions jmferrer/github-actions:latest
```

By default this runner runs without root access so you need to set up `RUNNER_ALLOW_RUNASROOT=1`.


## Environment variables

The image recognizes the following environment variables that you can set during initialization by passing `-e VAR=VALUE` to the Docker run command.

`URL`
Repository to add the runner to.

`TOKEN`
Registration token.

`NAME`
Name of the runner to configure (default: $(hostname) output)

`LABELS`
Extra labels in addition to the (default: 'self-hosted,Linux,X64')

`WORKSPACE`
Relative runner work directory (default /_work)

`REPLACE`
Replace any existing runner with the same name (default: 1)

## Volumes

You can also set the following mount points by passing the -v /host:/container flag to Docker.

VOLUME ["/_work"]

To use a volume you can add `-v $PWD/workspace:/_work`.

## Modify this docker image

Downloading the github actions runner and running `bin/Runner.Listener --help` could help you to know the available options.
