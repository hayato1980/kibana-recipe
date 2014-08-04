require 'serverspec'
require 'pathname'
require 'net/ssh'
 
include SpecInfra::Helper::Ssh
include SpecInfra::Helper::DetectOS
 
describe package('td-agent') do
  it { should be_installed.by('rpm').with_version("1.1.19-0") }
end
 
describe command('td-agent --version') do
  it { should return_stdout /0\.10\.45/ }
end
