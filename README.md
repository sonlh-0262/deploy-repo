- [Setup server](#setup-server)
  - [Create deploy user](#create-deploy-user)
  - [Install nginx](#install-nginx)
  - [Clone repo deploy](#clone-repo-deploy)
  - [Install cap](#install-cap)
  - [Config nginx for rails app](#config-nginx-for-rails-app)
  - [Setup CD for GithubActions](#setup-cd-for-githubactions)
  - [Setup Sidekiq Capistrano](#setup-sidekiq-capistrano)
  - [Setup Redis using systemd](#setup-redis-using-systemd)
  - [Setup Mysql](#setup-mysql)
  - [Monitor server](#monitor-server)

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

# display full path terminal
chsh -s /bin/bash
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

cd ~/.ssh
touch authorized_keys
chmod 600 authorized_keys
cp ~/.ssh/id_rsa.pub authorized_keys

# Create shared file in folder deploy-repo/config
database.yml
master.key # It is copied from origin repo: ex: 78d5105fe4b0946fa6b8e48942e2eeac

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

#### Setup CD for GithubActions:

Setup github action config like `https://github.com/sonlh-0262/rails-api-demo/blob/master/.github/workflows/ruby.yml`

Add Secret in Actions Secret:

COPY `/home/deploy/.ssh/id_rsa` to `PRIVATEKEY` in Action secrets

COPY public IP server to `DEVSERVER` in Action secrets

#### Using rails

```
export RAILS_ENV=production

# go to folder
cd /home/deploy/apps/rails-api-demo/current

# run rails console
~/.rvm/bin/rvm default do  bundle exec rails c

# run sidekiq
~/.rvm/bin/rvm default do  bundle exec rails sidekiq
```


Create Alias
COPY to `.bashrc`:

```
alias sidekiq='cd /home/deploy/apps/rails-api-demo/current; ~/.rvm/bin/rvm default do  bundle exec sidekiq'
alias railsc='cd /home/deploy/apps/rails-api-demo/current; ~/.rvm/bin/rvm default do  bundle exec rails c'
```

`source .bashrc`

#### Setup Sidekiq Capistrano

Add `sidekiq` to Gemfile

Add to Capfile

```
require "capistrano/sidekiq"
install_plugin Capistrano::Sidekiq
install_plugin Capistrano::Sidekiq::Systemd
```

Test by `cap -T | grep sidekiq`

Run in cap:

```
cap production sidekiq:install
cap production sidekiq:start
cap production sidekiq:restart
```

Check systemd config:
```
# check if systemd is setup
ps aux | grep systemd 

# check environment
echo $XDG_RUNTIME_DIR

# if it is empty 
export XDG_RUNTIME_DIR=/run/user/`id -u`

# if there is error absolute path in sidekiq.service
# edit file ~/.config/systemd/user/sidekiq.service to use absolute path
# reload file after updated
systemctl --user daemon-reload
```

Copy file from local to ec2 instance using `scp`

```
$scp -i ~/Desktop/amazon.pem ~/Desktop/MS115.fa  ubuntu@ec2-54-166-128-20.compute-1.amazonaws.com:~/data/
```

#### Setup Redis using systemd

https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-redis-on-ubuntu-16-04

Bind option to allow remote access on the redis server:

```
# Edit /etc/redis/redis.conf
bind 127.0.0.1
to
bind 0.0.0.0

# Restart redis
sudo systemctl restart redis.service
```

#### Setup Mysql

Install mysql-server
```
sudo apt-get update
apt search mysql-server # search lib
apt show mysql-server # show detail lib

sudo apt-get install -y mysql-server

# Optional: check secure
sudo mysql_secure_installation

# Check status and enable
sudo systemctl status mysql.service
sudo systemctl enable mysql.service
sudo systemctl start mysql.service
```
Guide: https://www.cyberciti.biz/faq/install-mysql-server-8-on-ubuntu-20-04-lts-linux/


Reset password root:

```
sudo service mysql stop

# Make sure folder exists
sudo mkdir /var/run/mysqld
sudo chown mysql /var/run/mysqld

sudo mysqld_safe --skip-grant-tables&
ENTER

mysql -uroot
use mysql

# MySQL 8 – Reset Root Password
UPDATE mysql.user SET authentication_string=null WHERE User='root';
flush privileges;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your_password_here';
flush privileges;
exit;

# MySQL 5.7 – Reset Root Password
update user set authentication_string=PASSWORD('your_password_here') where user='root';
update user set plugin="mysql_native_password" where User='root';
flush privileges;
exit

```

Guide: https://devanswers.co/how-to-reset-mysql-root-password-ubuntu/

Setup to connect client to mysql server:
```
# Edit file /etc/mysql/my.cnf
bind-address 0.0.0.0
```

Create User in mysql:
```
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';
FLUSH PRIVILEGES;

DROP USER 'username'@'localhost';
```

Guide: https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql

#### Monitor server

Check memory usage:

```
ps -eo size,%mem,pid,user,command --sort -size | grep mysql
```

Print 10 process that spend the most memory:
```
ps aux --sort=-%mem | awk 'NR<=10{print $0}'
```

Check ip local:
```
curl https://ipinfo.io/ip
```
