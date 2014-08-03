require 'serverspec'
require 'pathname'
require 'net/ssh'
 
include SpecInfra::Helper::Ssh
include SpecInfra::Helper::DetectOS
 
describe package('elasticsearch') do
  it { should be_installed }
end

describe service('elasticsearch') do
  it { should be_enabled }
  it { should be_running }
end

describe port(9200) do
    it { should be_listening }
end
