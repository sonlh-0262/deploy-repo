#### Download package
```
wget http://download.redis.io/releases/redis-3.0.6.tar.gz
```

#### Uncompress
```
tar xzf redis-3.0.6.tar.gz
```

#### Build
```
cd redis-3.0.6 && make
```

#### Run tcl
```
sudo apt-get install -y tcl
```

#### Test
```
make test
```

#### Install
```
sudo make install
```

#### Setup up Redis to run as daemon
```
cd utils && sudo ./install_server.sh
```
#### Test
```
redis-cli -p 6379 PING
```
