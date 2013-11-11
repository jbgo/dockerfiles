FROM ubuntu:precise
MAINTAINER Jordan Bach jordan@jbcustomsoftware.com
RUN apt-get -yq install python-software-properties software-properties-common
RUN add-apt-repository ppa:pitti/postgresql
RUN apt-get -yq update
RUN apt-get -yq install postgresql-9.2 postgresql-client-9.2 postgresql-contrib-9.2
ADD ./pg_admin_user.sh /pg_admin_user.sh
ADD ./createdb.sh /createdb.sh
RUN chmod +x /*.sh
RUN /pg_admin_user.sh
RUN echo "listen_addresses = '*'" >> /etc/postgresql/9.2/main/postgresql.conf
ADD ./pg_hba.conf /etc/postgresql/9.2/main/pg_hba.conf

USER postgres
ENTRYPOINT /usr/lib/postgresql/9.2/bin/postgres -D /var/lib/postgresql/9.2/main -c config_file=/etc/postgresql/9.2/main/postgresql.conf
