## PostgreSQL

This image will now run correctly, but there is still some work to do
to get it production ready.

* TODO How do I run these commands non-interactively?
* TODO How do I securely generate and store random passwords?
* TODO How do I persist data across containers with docker volumes?
* TODO How do I automate backups?

### 1. Run the server

```
pg=$(docker run -d -p 5432:5432 jbgo/postgresql)
```

### 2. Get the IP address

```
pg_host=$(docker inspect $pg | grep IPAddr | cut -d '"' -f 4)
```

### 3. Create a new user and database for the application

The default password for the `docker` user is also `docker`.
I am creating a user named `appuser` with the password `supersecret`.
You will want to replace these with your own user/password.

```
docker run -i -t -entrypoint=/bin/bash -e pg_host=$pg_host -u root pg
createuser -U docker -h $pg_host -l -P appuser
createdb -U docker -h $pg_host -O appuser app_db_name
^D
```

### 4. Run database migrations

This assumes you have a docker image for your rails app tagged user/app_name.
You should replace this with an actual image for a rails app.

```
pg_url=postgres://appuser:supersecret@$pg_host:5432/app_db_name
docker run -e RAILS_ENV=production -e DB=$pg_url user/appname rake db:migrate
app1=$(docker run -d -e RAILS_ENV=production -e DB=$pg_url -p 4001:4567 user/appname puma -t 4:4 -w 1 -p 4567)
```

You can run multiple instances of your app by specifying different host ports.
In the following example, I run 2 more instances on host ports 4002 and 4003.

```
app2=$(docker run -d -e RAILS_ENV=production -e DB=$pg_url -p 4002:4567 user/appname puma -t 4:4 -w 1 -p 4567)
app3=$(docker run -d -e RAILS_ENV=production -e DB=$pg_url -p 4003:4567 user/appname puma -t 4:4 -w 1 -p 4567)
```

### 5. Make a test request

At this point, your rails app is running on host port 4001 and connected
to our postgresql database. Let's make a request and see what happens.

```
curl localhost:4001/ | less
curl localhost:4002/ | less
curl localhost:4003/ | less
```

If you see your app's home page, you win! If not, keep trying.
