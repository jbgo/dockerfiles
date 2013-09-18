A collection of Dockerfiles for my Docker images on https://index.docker.io/u/jbgo/

## Getting started - install Docker's Vagrant box

I like to play around with things locally before trying it out on a hosted VM.

```
git clone https://github.com/jbgo/dockerfiles.git
cd dockerfiles
vagrant up
vagrant ssh
sudo docker version
```

If you get a version number, you're good to go.

If you get tired of typing sudo all the time, then run the commands as root: `sudo su - root`

## PostgreSQL

Run from the image.

```
docker pull jbgo/postgresql
image=$(docker run -d jbgo/postgresql)
ip=$(docker inspect $image | grep IPAddress | awk '{print $2}' | tr -d ',"')
apt-get -y install postgresql-client
psql -h $ip -U docker -d postgres
# the default password is 'foobar'
```

Build your own image. Replace <you> with your Docker index user name.

```
git clone https://github.com/jbgo/dockerfiles.git
cd dockerfiles/postgresql
# ... edit as you see fit
docker build -t <you>/postgresql .
# test it
docker run -d <you>/postgresl
# upload your version to the index
docker push <you>/postgresql
```
