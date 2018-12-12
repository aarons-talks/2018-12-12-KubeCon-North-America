# Kubernetes is Still Hard for Developers, Let's Fix That!

This repository has demo code for my [KubeCon North America 2018 talk](https://sched.co/GrTQ).

This demo turns the ["hello world" Flask application](http://flask.pocoo.org/) into a Kubernetes-ready app, and then deploys it. It does everything with [draft](https://draft.sh) and uses Minikube so that almost everything is local (so that I don't get bitten by Wifi :smiling:).

_You'll need a [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/) cluster running for this demo to work. If you want to use a remote cluster, check out [these instructions](https://github.com/Azure/draft/blob/master/docs/install-cloud.md)_

## Step 1 - Bootstrap the Repository for Kubernetes

This will set up all the files in your local repo you need to get started:

```console
draft create
```

## Step 2 - Set Up Docker Environment

For minikube, run this in your terminal to set up all the environment variables draft needs:

```console
eval $(minikube docker-env)
```

## Step 3 - Build and Deploy the App!

This command will build and push the docker image, and then automatically open a proxy to the running app :smile:. After the proxy is open, the command line output will tell you the proxy port. Set that value to the `DRAFT_PORT` environment variable.

```console
draft up --auto-connect
```

## Step 4 - Make a Request to the Flask App

After you've opened up the proxy and set the `DRAFT_PORT` env. var, do a `curl` to it:

```console
curl localhost:${DRAFT_PORT}
```

Next, change the code and re-run `draft up --auto-connect` to get a new image built and deployed with your changes.
