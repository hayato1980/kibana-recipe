require 'serverspec'
require 'pathname'
require 'net/ssh'
 
include SpecInfra::Helper::Ssh
include SpecInfra::Helper::DetectOS
 
describe package('httpd') do
  it { should be_installed }
end
 
describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end
 
describe port(80) do
    it { should be_listening }
end
