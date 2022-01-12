### Rebuild an image

```
docker-compose build <service name>
```

### List container

```
docker-compose ps
docker-compose ps -a
```

### Normal commands

```
docker-compose up [service_name]
docker-compose down [service_name]
docker-compose start [service_name]
docker-compose stop [service_name]
docker-compose restart [service_name]
docker-compose [start|stop|kill|restart|pause|unpause|rm] <service name> 
```

### Viewing the container logs

```
docker-compose logs -f [service_name]
```

### Running one-off commands

```
# With create new container
docker-compose run --rm web echo 'ran a different command' 

# without create new container
docker-compose exec web echo 'ran a different command' 
```

### Clean container with compose

```
docker-compose rm
```

### Pruning: free up unused resources
```
docker image prune

# free all, include unused image and container
docker system prune
```

### Other commands

```
# list all container without `educative`
docker ps --format '{{.Names}}' | grep -v "educative" | awk '{print $1}'

# stop all container with condition
docker stop $(docker ps --format '{{.Names}}' | grep -v "educative" | awk '{print $1}')

# delete all the containers
docker rm $(docker ps -aq --filter status=exited)

# delete all network
docker network prune -f

# delete all images
docker rmi -f $(docker images -qa)
```
