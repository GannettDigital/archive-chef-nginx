# Encoding: utf-8
require_relative 'spec_helper'

describe package($node['nginx']['package_name']) do
  it { should be_installed }
end

describe service($node['nginx']['package_name']) do
  it { should be_running }
  it { should be_enabled }
end

