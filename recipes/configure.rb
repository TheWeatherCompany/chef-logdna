#
# Cookbook:: chef_logdna
# Recipe:: configure
#
# Copyright:: 2018, The Authors, All Rights Reserved.

conf_key = node['logdna']['conf_key']
conf_config = node['logdna']['conf_config']
conf_logdir = node['logdna']['conf_logdir']
conf_logfile = node['logdna']['conf_logfile']
conf_exclude = node['logdna']['conf_exclude']
conf_hostname = node['logdna']['conf_hostname']
conf_tags = node['logdna']['conf_tags']
conf_exclude_regex = node['logdna']['conf_exclude_regex']
conf_apihost = node['logdna']['conf_apihost']
conf_loghost = node['logdna']['conf_loghost']

template '/etc/logdna.conf' do
  source 'logdna.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables({
              config_key:           conf_key,
              config_config:        conf_config,
              config_logdir:        conf_logdir,
              config_logfile:       conf_logfile,
              config_exclude:       conf_exclude,
              config_hostname:      conf_hostname,
              config_tags:          conf_tags,
              config_exclude_regex: conf_exclude_regex,
              config_apihost:       conf_apihost,
              config_loghost:       conf_loghost,
            })
  action :create
  notifies :restart, 'service[logdna-agent]', :delayed
end
