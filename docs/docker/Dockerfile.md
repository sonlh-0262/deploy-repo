### Example

```
FROM ruby:2.7
RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs
COPY myapp /usr/src/app
WORKDIR /usr/src/app
RUN bundle install
```

### Notice

- Official Ruby image is based on Debian, version call Stretch
(command `apt-get` is used to install software on Debian (and some other) Linux distribution)

- Option `-yqq` is combine of `-y` that will say answer to YES, and `-qq` that enables QUITE mode to reduce printed output
- `--no-install-recommends` : not to install other recommended but non-essential packages => reduce image size

- `WORKDIR` can have multiple times, each one remain in effect untill another one is issued. Final `WORKDIR` will be initial working directory for containers created from image

### Build image
Build image from Dockerfile

```
docker build [options] /path/to/build/directory
docker build -t railsapp .
```

Explain:
- Each instruction in Dockerfile will start a throwaway container based on image created in previous step, then Docker commit changes as a result of excute instruction 
=> create a new intermediate image for this step

### Tag image

```
docker tag
```

### Run Rails server

```
docker run -p 3000:3000 railsapp bin/rails s -b 0.0.0.0
```

Explain: why need to bind Rails server to IP address

```
Normally, to start a Rails server, we would simply run bin/rails s, yet when we started the Rails server with docker run, we used bin/rails s -b 0.0.0.0. Why was that? When you start the Rails server with bin/rails s, by default, it only listens to requests on localhost (or 127.0.0.1) on whatever machine it’s running on. This provides a secure default, preventing the Rails app server from being accessed externally.

However, in our case, the server is running inside a container, but the request is coming from outside. The s option routes the request to the container running the Rails server, by translating the request to [IP address of container]:3000.

However, as the Rails server is only listening to requests on localhost, nothing responds to this request coming in from a different IP address. The -b 0.0.0.0 tells our Rails server to bind to all IP addresses and not just to localhost. The IP address 0.0.0.0 is a special address that means “all IPv4 address on this machine.”
```

### Finding IP address of a running container

```
docker inspect --format '{{ .NetworkSettings.IPAddress }}' [containerID]
```
