require 'serverspec'
require 'pathname'
require 'net/ssh'
 
include SpecInfra::Helper::Ssh
include SpecInfra::Helper::DetectOS
 
describe file('/var/www/html/kibana') do
  it { should be_directory }
  it { should be_owned_by 'root' }
end
