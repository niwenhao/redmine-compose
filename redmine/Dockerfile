from ubuntu:xenial
run apt-get update -y
run apt-get install -y aptitude
run apt-get install -y build-essential
run aptitude install -y libsqlite3-dev
run aptitude install -y mysql-client libmysqlclient-dev
run aptitude install -y vim
run aptitude install -y ruby-dev
run aptitude install -y rubygems
run aptitude install -y imagemagick libmagick-dev libmagickcore-dev libmagickwand-dev
run aptitude install -y pkg-config
run gem install bundle
add redmine-3.2.3.tar.gz /opt/
run ln -s /opt/redmine-3.2.3 /opt/redmine
workdir /opt/redmine
run bundle install
cmd while true; do sleep 10; done

