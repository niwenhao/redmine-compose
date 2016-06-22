from niwenhao/ruby
add rootca.crt /etc/.
env CURL_CA_BUNDLE /etc/rootca.crt
env HTTP_PROXY ${HTTP_PROXY}
env http_proxy ${http_proxy}
env HTTPS_PROXY ${HTTPS_PROXY}
env https_proxy ${https_proxy}

run cp /etc/rootca.crt /usr/local/lib/ruby/2.3.0/rubygems/ssl_certs/rootca.pem
run gem install bundle
workdir /tmp
run curl http://www.redmine.org/releases/redmine-3.2.3.tar.gz | tar -xzf -
run mkdir -p /var/www && mv /tmp/redmine-3.2.3 /var/www/redmine
workdir /var/www/redmine
run echo 'gem "passenger", ">= 5.0.25", require: "phusion_passenger/rack_handler"' >> Gemfile
add database.yml config/.
add configuration.yml config/.
env RAILS_ENV production
run echo 'gem "spreadsheet"' >> Gemfile
run echo 'gem "will_paginate"' >> Gemfile
run echo 'gem "httpclient"' >> Gemfile
run echo 'gem "byebug"' >> Gemfile
run cd plugins && git clone https://github.com/ameya86/redmine_already_read.git
run cd plugins && git clone https://github.com/altsol/redmine_mattermost.git redmine_mattermost
run aptitude install -y subversion
run svn co http://192.177.237.12:8080/svn/AplTools/dev-branch/030.RedMine/tradestar plugins/tradestar
run bundle install
add _vimrc /root/
add _bashrc /root/
run cd /root && cat _vimrc >> .vimrc && cat _bashrc >> .bashrc
add production.rb /var/www/redmine/config/environments/
run aptitude install -y rsyslog cron
cmd service cron start; service rsyslog start; passenger start -e production

