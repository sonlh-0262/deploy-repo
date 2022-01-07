- Install node, yarn

```
# Install nvm
sudo apt install curl 
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
source ~/.profile   
(reference https://tecadmin.net/how-to-install-nvm-on-ubuntu-20-04/)

# Install node
nvm install node_version

# check node version after install
node -v

# install yarn
npm install -g yarn
```

- Create next project

```
yarn create next-app
```
