from debian
add rootca.crt /etc/.
env CURL_CA_BUNDLE /etc/rootca.crt
env HTTP_PROXY http://isc00362:nwh1605@172.19.246.129:88/
env http_proxy http://isc00362:nwh1605@172.19.246.129:88/
env HTTPS_PROXY http://isc00362:nwh1605@172.19.246.129:88/
env https_proxy http://isc00362:nwh1605@172.19.246.129:88/
run apt-get update -y
run apt-get install -y aptitude
run aptitude install -y build-essential libsqlite3-dev mysql-client libmysqlclient-dev vim
run aptitude install -y ruby-dev rubygems imagemagick libmagick-dev libmagickcore-dev libmagickwand-dev
run aptitude install -y pkg-config curl subversion net-tools tmux

run cp /etc/rootca.crt /usr/lib/ruby/2.1.0/rubygems/ssl_certs/rootca.pem
run gem install bundle
workdir /tmp
run curl http://www.redmine.org/releases/redmine-3.2.3.tar.gz | tar -xzf -
run mkdir -p /var/www && mv /tmp/redmine-3.2.3 /var/www/redmine
workdir /var/www/redmine
run echo 'gem "passenger", ">= 5.0.25", require: "phusion_passenger/rack_handler"' >> Gemfile
add database.yml config/.
run bundle install
add configuration.yml config/.
env RAILS_ENV production
env LANG ja_JP.UTF8
run aptitude install -y locales locales-all
run localedef -i ja_JP -f UTF-8 ja_JP.UTF8
run echo 'gem "spreadsheet"' >> Gemfile
run echo 'gem "will_paginate"' >> Gemfile
run bundle install
run aptitude install -y git
run cd plugins && git clone https://github.com/ameya86/redmine_already_read.git
run aptitude install -y procps
run cd plugins && git clone https://github.com/altsol/redmine_mattermost.git redmine_mattermost
run svn co http://192.177.237.12:8080/svn/AplTools/dev-branch/030.RedMine/tradestar_3.2.3 plugins/tradestar
run echo 'gem "httpclient"' >> Gemfile
run bundle install
cmd sleep 5 && passenger start -e production

