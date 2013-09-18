# Dockerfile for PostgreSQL service
# http://docs.docker.io/en/latest/examples/postgresql_service/

FROM ubuntu:precise
MAINTAINER Jordan Bach jordan@jbcustomsoftware.com
RUN apt-get -y install python-software-properties software-properties-common
RUN add-apt-repository ppa:pitti/postgresql
RUN apt-get -y update
RUN apt-get -y install postgresql-9.2 postgresql-client-9.2 postgresql-contrib-9.2
RUN echo 'host all all 0.0.0.0/0 md5' >> /etc/postgresql/9.2/main/pg_hba.conf
RUN echo "listen_addresses = '*'" >> /etc/postgresql/9.2/main/postgresql.conf
ADD pg_admin_user.sh /usr/bin/pg_admin_user.sh
RUN chmod +x /usr/bin/pg_admin_user.sh
RUN /usr/bin/pg_admin_user.sh
RUN rm /usr/bin/pg_admin_user.sh

ENTRYPOINT ["/usr/lib/postgresql/9.2/bin/postgres", "-D", "/var/lib/postgresql/9.2/main", "-c", "config_file=/etc/postgresql/9.2/main/postgresql.conf"]
USER postgres
EXPOSE 5432
