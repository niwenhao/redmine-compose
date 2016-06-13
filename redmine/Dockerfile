from ubuntu:xenial
add rootca.crt /etc/.
env CURL_CA_BUNDLE /etc/rootca.crt
env HTTP_PROXY http://isc00362:nwh1605@172.19.246.129:88/
env http_proxy http://isc00362:nwh1605@172.19.246.129:88/
env HTTPS_PROXY http://isc00362:nwh1605@172.19.246.129:88/
env https_proxy http://isc00362:nwh1605@172.19.246.129:88/
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
run aptitude install -y curl

run cp /etc/rootca.crt /usr/lib/ruby/2.3.0/rubygems/ssl_certs/rootca.pem
run gem install bundle
workdir /opt
run curl http://www.redmine.org/releases/redmine-3.2.3.tar.gz | tar -xzf -
run ln -s /opt/redmine-3.2.3 /opt/redmine
workdir /opt/redmine
run echo 'gem "passenger", ">= 5.0.25", require: "phusion_passenger/rack_handler"' >> Gemfile
add database.yml config/.
run bundle install
add configuration.yml config/.
cmd sleep 5 && passenger start -e production

