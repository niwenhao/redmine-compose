from debian
add rootca.crt /etc/.
env CURL_CA_BUNDLE /etc/rootca.crt
env HTTP_PROXY http://isc00362:nwh1605@172.19.246.129:88/
env http_proxy http://isc00362:nwh1605@172.19.246.129:88/
env HTTPS_PROXY http://isc00362:nwh1605@172.19.246.129:88/
env https_proxy http://isc00362:nwh1605@172.19.246.129:88/
run apt-get update -y
run apt-get install -y aptitude
run aptitude install -y build-essential mysql-client libmysqlclient-dev vim
run aptitude install -y pkg-config curl subversion net-tools dnsutils
env LANG ja_JP.UTF8
run aptitude install -y locales locales-all
run localedef -i ja_JP -f UTF-8 ja_JP.UTF8
workdir /usr/local/
run curl https://releases.mattermost.com/3.1.0/mattermost-team-3.1.0-linux-amd64.tar.gz | tar -xzf -
add config.json /usr/local/mattermost/config/
add _vimrc /root/
add _bashrc /root/
add config.json /usr/local/mattermost/config/
run cd /root && cat _vimrc >> .vimrc && cat _bashrc >> .bashrc

workdir /usr/local/mattermost
cmd bin/platform -config=$PWD/config/config.json
