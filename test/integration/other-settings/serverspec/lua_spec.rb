# Encoding: utf-8
require_relative 'spec_helper'

luajit_src_filename = ::File.basename($node['nginx']['luajit']['url'])
luajit_src_filepath = "/tmp/kitchen/cache/#{luajit_src_filename}"
luajit_extract_path = "/tmp/kitchen/cache/luajit-#{$node['nginx']['luajit']['version']}"

describe file(luajit_src_filepath) do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:sha256sum) { should eq $node['nginx']['luajit']['checksum'] }
end

describe package("lua-devel") do
  it { should be_installed }
end