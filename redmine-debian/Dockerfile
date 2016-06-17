from debian
run apt-get update -y
run apt-get install -y aptitude
run aptitude install -y build-essential libsqlite3-dev mysql-client libmysqlclient-dev vim
run aptitude install -y ruby-dev rubygems imagemagick libmagick-dev libmagickcore-dev libmagickwand-dev
run aptitude install -y pkg-config curl subversion net-tools tmux
run aptitude install -y locales locales-all git procps
run gem install bundle
run localedef -i ja_JP -f UTF-8 ja_JP.UTF8
env LANG ja_JP.UTF8
env RAILS_ENV production
workdir /tmp
run curl http://www.redmine.org/releases/redmine-3.2.3.tar.gz | tar -xzf -
run mkdir -p /var/www && mv /tmp/redmine-3.2.3 /var/www/redmine
workdir /var/www/redmine
run echo 'gem "passenger", ">= 5.0.25", require: "phusion_passenger/rack_handler"' >> Gemfile
add database.yml config/.

add configuration.yml config/.
run echo 'gem "spreadsheet"' >> Gemfile
run echo 'gem "will_paginate"' >> Gemfile
run echo 'gem "httpclient"' >> Gemfile
run echo 'gem "byebug"' >> Gemfile
run cd plugins && git clone https://github.com/ameya86/redmine_already_read.git
run cd plugins && git clone https://github.com/altsol/redmine_mattermost.git redmine_mattermost
run bundle install
run grep -v "passenger" Gemfile > a && mv a Gemfile
add _vimrc /root/
add _bashrc /root/
run cd /root && cat _vimrc >> .vimrc && cat _bashrc >> .bashrc
add production.rb /var/www/redmine/config/environments/
cmd passenger start -e production

