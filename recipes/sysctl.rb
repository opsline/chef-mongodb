#
# Cookbook Name:: mongodb
# Recipe:: sysctl
#

return if node[:mongodb][:package_version].nil?
major = node[:mongodb][:package_version].split('.')[0]
return unless major == '3'

execute 'sysctl /sys/kernel/mm/transparent_hugepage/enabled' do
  command 'echo never > /sys/kernel/mm/transparent_hugepage/enabled'
  not_if 'grep -q "\[never\]" /sys/kernel/mm/transparent_hugepage/enabled'
  user 'root'
  group 'root'
  action :run
end

execute 'sysctl /sys/kernel/mm/transparent_hugepage/defrag' do
  command 'echo never > /sys/kernel/mm/transparent_hugepage/defrag'
  not_if 'grep -q "\[never\]" /sys/kernel/mm/transparent_hugepage/defrag'
  user 'root'
  group 'root'
  action :run
end
