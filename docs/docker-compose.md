Docker Compose is a Python application that you install on top of the Docker Engine

#### up
```
$ docker-compose up -d
```

#### ps
```
$ docker-compose ps
```

You can see both containers, the commands they are running, their current state, and the network ports they are listening on.

#### top
```
$ docker-compose top
```

#### stop
```
$ docker-compose stop
```

Use the docker-compose stop command to stop the app without deleting its resources. Then show the status of the app with docker-compose ps

You can delete a stopped Compose app with docker-compose rm. This will delete the containers and networks the app is using, but it will not delete volumes or images.

#### restart
```
$ docker-compose restart
```

#### down
```
$ docker-compose down
```
