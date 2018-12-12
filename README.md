# Kubernetes is Still Hard for Developers, Let's Fix That!

This repository has demo code for my [KubeCon North America 2018 talk](https://sched.co/GrTQ).

This demo turns the ["hello world" Flask application](http://flask.pocoo.org/) into a Kubernetes-ready app, and then deploys it. It does everything with [draft](https://draft.sh) and uses Minikube so that almost everything is local (so that I don't get bitten by Wifi :smiling:).

_You'll need a [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/) cluster running for this demo to work. If you want to use a remote cluster, check out [these instructions](https://github.com/Azure/draft/blob/master/docs/install-cloud.md)_

## Step 1 - Bootstrap the Repository for Kubernetes

This will set up all the files in your local repo you need to get started:

```console
draft create --app kubecon2018
```

## Step 2 - Set Up Docker Environment

For Minikube, run this to set up your docker environment for draft:

```console
make setup
```

## Step 3 - Build and Deploy the App!

This command will build and push the docker image, and then automatically open a proxy to the running app :smile:. After the proxy is open, the command line output will tell you the proxy port. Set that value to the `DRAFT_PORT` environment variable.

```console
draft up
```

## Step 4 - See Your Build in the Build History

After your build & deploy succeeded, draft creates **release** and a **log** with all the builds you did for that release. Every time you do a `draft up`, you'll see another build in the log:

```console
draft history
```

## Step 5 - Create the Tunneling Proxy and Make a Request to the Flask App

Draft can run a local server that tunnels requests into your app running in a Kubernetes pod. Start the server with:

```console
draft connect -p 8080:8080
```

Then, in a different terminal, run:

```console
curl localhost:8080
```

Whenever you want, you can change the code, re-run `draft up` and `draft up` and continue making `curl` requests.

## Step 6 - Clean Up

Clean up your app from the cluster with:

```console
draft delete
```

And clean up the local files that Draft created (when you ran `draft init`) with:

```console
make clean
```
