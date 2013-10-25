FROM base
RUN apt-get install -y git curl build-essential libssl-dev libreadline-dev zlib1g-dev
RUN git clone https://github.com/sstephenson/ruby-build.git
WORKDIR ruby-build
RUN ./install.sh
RUN  ruby-build 2.0.0-p247 /usr/local/ruby
ENV PATH /usr/local/ruby/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN gem install bundler
