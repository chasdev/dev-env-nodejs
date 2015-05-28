# dev-env-nodejs

A development environment for node.js that uses vim, tmux, wemux, and git.  This Dockerfile simply installs node.js and is used to extend '[dev-env](https://github.com/chasdev/dev-env)' which installs and configures vim, tmux, wemux, and git.

Please read the dev-env [README.md](https://github.com/chasdev/dev-env/blob/master/README.md) for details.

This container represents my personal development environment, and is subject to change. Use at your own risk. There are many resources that contributed to the development of this development environment (please see the dev-env README for links to helpful references).

## Building the image and running a container

####To build the image:

```
$ docker build -t chasdev/dev-env-nodejs .
```

Next we'll start the container. The following mounts '~/working' as '/working' within the container, as I keep all of my code under this directory. This container allows multiple users who are identified in the comma-deliminated environment variable set below. These users must be GitHub users, and their public keys will be retrieved and added to the container. (This uses a ssh_key_adder.rb ruby script developed by Don Petersen.)

####To run the container:

```
docker run \
-d -e AUTHORIZED_GH_USERS="chasdev" \
-p 0.0.0.0:12345:22 \
-p 0.0.0.0:3000:3000 \
-v /Users/chas/working:/working \
chasdev/dev-env-nodejs:latest
```

As discussed in the dev-env README, this container is used as a 'development environment' and provides ssh connectivity which is not a best practice for 'service' containers. Most of your containers should use 'nsenter' in lieu of ssh.  This container also exposes port 3000 (typical of node.js services). This is mapped to the VM running docker, which may be boot2docker or vagrant if running on OS X (so, you'll either need to setup port forwarding or use the VMs IP address when interacting with a service running in the container using port 3000).
