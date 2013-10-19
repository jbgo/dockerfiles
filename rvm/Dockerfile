from ubuntu:precise

run apt-get -y update
run apt-get install -y curl build-essential

run curl -L https://get.rvm.io | bash -s stable

ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
run /usr/local/rvm/bin/rvm-shell && rvm requirements
run /usr/local/rvm/bin/rvm-shell && rvm install 2.0.0
run /usr/local/rvm/bin/rvm-shell && rvm use 2.0.0 --default

ENV PATH /usr/local/rvm/rubies/ruby-2.0.0-p247/bin:/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
