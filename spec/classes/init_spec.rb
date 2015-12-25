require 'spec_helper'
describe 'outlook_protocol' do

  context 'with defaults for all parameters' do
    it { should contain_class('outlook_protocol') }
  end
end
