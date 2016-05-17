#
# Cookbook Name:: mongodb
# Recipe:: logrotate
#

return unless default['mongodb']['config']['logpath']

logrotate_app 'mongodb' do
  cookbook 'logrotate'
  path node['mongodb']['config']['logpath']
  options ['copytruncate', 'missingok', 'compress', 'notifempty', 'delaycompress']
  frequency 'daily'
  rotate 14
  enable :create
end
