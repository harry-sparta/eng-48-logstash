#
# Cookbook:: logstash
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# -- Ubuntu & Apt updates-------------------------------------------
# update ubuntu
apt_update 'update ubuntu' do
  action :update
end

apt_update 'update_sources' do
  action :update
end

# -- Java ------------------------------------------------------
# Java install
apt_package 'openjdk-8-jdk' do
  action :install
end

# -- Logstash install-------------------------------------------
# Sourcelist. Import public key as logstash
execute 'logstash_wget' do
  command 'sudo wget https://download.elastic.co/logstash/logstash/packages/debian/logstash_2.3.4-1_all.deb'
  action :run
end

# Logstash update
execute 'logstash_install' do
  command 'dpkg -i logstash_2.3.4-1_all.deb'
  action :run
end

# Logstash update
execute 'logstash_update' do
  command 'sudo update-rc.d logstash defaults 97 8'
  action :run
end

# -- Logstash service-------------------------------------------
# Service start
execute 'logstash_start' do
  command 'sudo service logstash start'
  action :run
end

# Service restart
execute 'logstash_status' do
  command 'sudo service logstash status'
  action :run
end

# -- Files------------------------------------------------------
directory '/etc/logstash/' do
  action :create
end

template '/etc/logstash/conf.d/logstash.conf' do
  source 'logstash.conf.erb'
  action :create
  mode '777'
end

# -- Restarting Logstash service -------------------------------
execute 'logstash_restart' do
  command 'sudo systemctl restart logstash'
  action :run
end
