# Encoding: utf-8
require_relative 'spec_helper'

describe file("#{$node['ohai']['plugin_path']}/nginx.rb") do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 755 }
end
