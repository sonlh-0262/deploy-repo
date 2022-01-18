```
FROM nginx

RUN apt-get update -qq && apt-get -y install apache2-utils

ENV RAILS_ROOT /var/www/app_name

WORKDIR $RAILS_ROOT

# create log directory
RUN mkdir log

# copy static assets
COPY public public/

# Copy nginx config template
COPY docker/web/nginx.conf /tmp/docker.nginx

# substitute variable references in the Nginx config template for real values from the environment 
# put the final config in its place

RUN envsubst '$RAILS_ROOT' < /tmp/docker.nginx > /etc/nginx/conf.d/default.conf

EXPOSE 80

# Use `exec` form of CMD so nginx shutdown gracefully on SIGTERM (docker stop)
CMD ["nginx", "-g", "daemon off;"]
```
