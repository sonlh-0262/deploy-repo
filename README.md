# README

Config Capistrano deploy Rails

* Ruby: 2.6.6 

* Run:
```
cap production deploy
```

### Setup server:

#### Create deploy user

```
# create user deploy with home directory
sudo useradd deploy -m 

sudo passwd deploy

# edit file 
sudo visudo -f /etc/sudoers

sudo su - deploy
```

#### Install nginx
```
sudo apt-get update -y
sudo apt-get install -y
```

#### Clone repo deploy
```
cd

# create ssh key
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# copy ssh id_rsa.pub to github rails app

# clone deploy-repo
git clone git@github.com:sonlh-0262/deploy-repo.git
cd deploy-repo
```

#### Install cap
```
# Install ruby
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash
source /home/deploy/.rvm/scripts/rvm
rvm install 2.6.6

# Install bundler
gem install bundler

# Install gem for deploy-repo
bundle install

# Install mysql dependency
sudo apt-get install -y libmariadb-dev
sudo apt-get install libmysqlclient-dev -y

# If to want to deploy in localhost server, 
copy `.ssh/id_rsa.pub` to `authorized_keys`

# Create shared file in folder deploy-repo/config
database.yml
master.key # It is copied from origin repo

# Run cap
cap production deploy

# Test install success
cap production puma:status
```

#### Config nginx for rails app
create new file or edit `default` in `/etc/nginx/sites-enabled/`, remove default file if create a new config file

File content:

```
upstream puma {
  server unix:///home/deploy/apps/rails-api-demo/shared/tmp/sockets/rails-api-demo-puma.sock fail_timeout=0;
}

server {
  listen 80;
  server_name _;
  root /home/deploy/apps/rails-api-demo/current/public;
  access_log /home/deploy/apps/rails-api-demo/current/log/nginx.access.log;
  error_log /home/deploy/apps/rails-api-demo/current/log/nginx.error.log info;

  try_files $uri/index.html $uri @puma;
  location @puma {
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header X-Forwarded-Port $server_port;
    proxy_set_header X-Forwarded-Host $host;

    proxy_redirect off;
    proxy_pass http://puma;
  }

  error_page 500 502 503 504 /500.html;
  client_max_body_size 100M;
  keepalive_timeout 10;
}

```

Reset nginx:
```
sudo service nginx restart
```
