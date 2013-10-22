FROM base
RUN apt-get install -y ca-certificates wget build-essential
RUN wget -O ruby-install-0.3.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.3.1.tar.gz
RUN tar -xzvf ruby-install-0.3.1.tar.gz
WORKDIR /ruby-install-0.3.1
RUN make install
RUN ruby-install ruby 2.0.0-p247
ENV PATH /opt/rubies/ruby-2.0.0-p247/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
