#
# Cookbook:: chef_logdna
# Recipe:: configure
#
# Copyright:: 2018, The Authors, All Rights Reserved.

conf_key = node['logdna']['conf_key']
conf_logdir = node['logdna']['conf_logdir']
conf_logfile = node['logdna']['conf_logfile']
conf_apihost = node['logdna']['conf_apihost']
conf_loghost = node['logdna']['conf_loghost']
conf_tags = node['logdna']['conf_tags']
conf_hostname = node['logdna']['conf_hostname']

template '/etc/logdna.conf' do
  source 'logdna.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables({
              config_key:           conf_key,
              config_logdir:        conf_logdir,
              config_logfile:       conf_logfile,
              config_apihost:       conf_apihost,
              config_loghost:       conf_loghost,
              config_tags:          conf_tags,
              config_hostname:      conf_hostname,
            })
  action :create
  notifies :restart, 'service[logdna-agent]', :delayed
end
