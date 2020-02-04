# InSpec test for recipe logstash::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

describe package 'logstash' do
  it { should be_installed }
  its("version"){ should match /2\./}
end

# This is an example test, replace it with your own test.
describe service 'logstash' do
  it { should be_running }
  it { should be_enabled }
end

# This is an example test, replace it with your own test.
describe port(5044) do
  it { should be_listening }
end

describe port(9200) do
  it { should be_listening }
end
