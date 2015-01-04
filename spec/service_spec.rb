require 'spec_helper'


describe GenericWebHook::Service do

  it 'should return a list of services' do
    expect {GenericWebHook::Service.list}.to_not raise_error
    expect(GenericWebHook::Service.list).to be_a_kind_of Array
    expect(GenericWebHook::Service.list).not_to be_empty
    puts GenericWebHook::Service.list
  end

  it 'should have a url per service' do
    GenericWebHook::Service.list.each do |service|
      expect(service.to_url).not_to be_nil
    end

  end

end