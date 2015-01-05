require 'spec_helper'


describe GenericWebHook::ServiceDefinition do

  it 'should return a list of services' do
    expect {GenericWebHook::ServiceDefinition.list}.to_not raise_error
    expect(GenericWebHook::ServiceDefinition.list).to be_a_kind_of Array
    expect(GenericWebHook::ServiceDefinition.list).not_to be_empty
    puts GenericWebHook::ServiceDefinition.list
  end

  it 'should have a url per service' do
    GenericWebHook::ServiceDefinition.list.each do |service|
      expect(service.to_url).not_to be_nil
    end

  end

end