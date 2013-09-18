#!/bin/bash
su postgres sh -c "/usr/lib/postgresql/9.2/bin/postgres --single  -D  /var/lib/postgresql/9.2/main  -c config_file=/etc/postgresql/9.2/main/postgresql.conf" <<< "CREATE USER docker WITH SUPERUSER PASSWORD 'foobar';"
