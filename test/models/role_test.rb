require "test_helper"

describe Role do
  let(:role) { Role.create(name: 'admin') }

  it 'has unique role name' do
    role.must_be :valid?
    assert_equal Role.new(name: 'admin').valid?, false
  end
end
