require 'test_helper'

describe Organization do
  let(:organization) { Organization.new(name: 'test') }

  it 'must be valid' do
    organization.must_be :valid?
  end
end
