#!/bin/bash
set -e
# TODO: generate random admin password when installing new PG instance
# store this password in a file on the host for now until I find a better way
password=docker
sql="CREATE USER docker WITH SUPERUSER PASSWORD '$password';"
su postgres sh -c "/usr/lib/postgresql/9.2/bin/postgres --single  -D  /var/lib/postgresql/9.2/main  -c config_file=/etc/postgresql/9.2/main/postgresql.conf" <<< $sql
