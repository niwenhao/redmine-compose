create database redmine_production charater set = utf8;
create user redmine identified by 'password';
grant all on redmine_production.* to 'redmine'@'%';

