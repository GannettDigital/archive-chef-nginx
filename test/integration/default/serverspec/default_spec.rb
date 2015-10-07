# Encoding: utf-8
require_relative 'spec_helper'

describe file($node['nginx']['dir']) do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_by 'root' }
  it { should be_mode 755 }
end

describe file($node['nginx']['log_dir']) do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_by 'root' }
  it { should be_mode 755 }
end

describe file(File.dirname($node['nginx']['pid'])) do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_by 'root' }
  it { should be_mode 755 }
end

describe file("#{$node['nginx']['dir']}/nginx.conf") do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_by 'root' }
  it { should be_mode 644 }
end

describe file("#{$node['nginx']['dir']}/sites-available/default") do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_by 'root' }
  it { should be_mode 644 }
end

describe file("/etc/logrotate.d/nginx") do
  it { should be_file }
  it { should contain('"/var/log/nginx/*.log"') }
  it { should contain('daily') }
  it { should contain('create 644 nginx nginx') }
  it { should contain('rotate 10') }
  it { should contain('missingok') }
  it { should contain('compress') }
  it { should contain('delaycompress') }
  it { should contain('copytruncate') }
  it { should contain('notifempty') }
end


describe package($node['nginx']['package_name']) do
  it { should be_installed }
end

describe service($node['nginx']['package_name']) do
  it { should be_running }
  it { should be_enabled }
end

