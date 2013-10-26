#!/bin/bash
set -e
apt-get -yq install python-software-properties software-properties-common
add-apt-repository ppa:pitti/postgresql
apt-get -yq update
apt-get -yq install postgresql-9.2 postgresql-client-9.2 postgresql-contrib-9.2
