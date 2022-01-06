### Docker Architecture

- `Docker Engine`: main component of docker and serve as a client-server application
- `Docker Daemon`: doing : start, stop, and dictating container
- `Docker CLI`: thin client that tell Docker daemon to do 

Docker is built on Linux Containerization technology that Mac and Window do not have natively

Mac and window require install a lightweight Linux virtual machine that runs Docker daemon

Linux OS:

[](https://github.com/sonlh-0262/deploy-repo/blob/master/docs/assets/Screenshot%20from%202022-01-06%2011-06-02.png)

Mac and Window OS:
[](https://github.com/sonlh-0262/deploy-repo/blob/master/docs/assets/Screenshot%20from%202022-01-06%2011-06-08.png)

Unix process have 3 channels for I/O:
- standard input (stdin)
- standard output (stdout)
- standard error (stderr)

Explain option `-i` and `-t`:

```
Since the Docker daemon runs in a separate process, Docker would have to actively do something to forward our CLI input to the Docker daemon.

By default, docker run only forwards the container’s output to our client. That is fine if we want to run a container that requires no input. However, sometimes we run processes that do require input, like an interactive Bash session that waits to receive the commands we enter. In this case, we need to explicitly tell Docker to forward our CLI input to the Docker daemon. We do this with the -i option, which is for input. If we did not specify this, the container would terminate immediately, because Bash receiving no input would terminate.

Moreover, an interactive Bash session must be run inside. A terminal emulator is responsible for things like displaying a prompt and interpreting escape sequences such as Ctrl-C.

If we start a container to run Bash, by default, this runs in noninteractive mode, executing any commands provided, and terminating once it’s done. To achieve a long-lived, interactive Bash session inside a Docker container, we have to tell Docker to set up a terminal emulator for us that sits in front of Bash. We do this by specifying the -t for the docker run.

If all this sounds quite complicated, just remember that whenever you need a long-lived, interactive session, you need to specify both the -i and -t options.
```

### Commands

#### Create a container from image:

```
docker run [OPTIONS] images command
docker run --rm -it -v ${PWD}:/usr/src/app ruby:2.7 bash
```
