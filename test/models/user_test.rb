require "test_helper"

describe User do
  let(:user) {
    User.new(email: 'test@test.com',
      password: 'q1w2e3r4',
      password_confirmation: 'q1w2e3r4')
  }

  it 'must be valid' do
    user.must_be :valid?
  end
end
