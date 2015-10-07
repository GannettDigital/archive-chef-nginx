# Encoding: utf-8
require_relative 'spec_helper'

describe file("#{$node['nginx']['dir']}/authorized_ip") do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  it { should contain('geo $remote_addr $authorized_ip') }
  it { should contain('default no') }
  it { should contain('127.0.0.1/32 yes') }
end
