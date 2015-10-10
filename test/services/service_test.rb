require 'test_helper'

describe Service do
  it 'generates a random key with lenght 8' do
    assert_equal Service.random_key.size, 8
  end
end