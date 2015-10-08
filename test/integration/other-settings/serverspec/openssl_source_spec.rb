# Encoding: utf-8
require_relative 'spec_helper'

src_filename = ::File.basename($node['nginx']['openssl_source']['url'])
src_filepath = "/tmp/kitchen/cache/#{src_filename}"
extract_path = "/tmp/kitchen/cache/openssl-#{$node['nginx']['openssl_source']['version']}"

describe file(src_filepath) do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
end
