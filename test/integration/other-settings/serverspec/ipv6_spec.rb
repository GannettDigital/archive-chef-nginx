# Encoding: utf-8
require_relative 'spec_helper'

describe command("#{$node['nginx']['binary']} -V") do
  its(:stderr) { should contain('--with-ipv6') }
  its(:exit_status) { should eq 0 }
end