require "test_helper"

describe User do
  let(:user) {
    User.new(email: 'test@test.com',
      role: 'admin',
      password: 'q1w2e3r4',
      password_confirmation: 'q1w2e3r4')
  }

  it 'must be valid' do
    user.must_be :valid?
  end

  describe '.build_new_user' do
    it 'creates a new user' do

      user = User.build_new_user(
        name: 'test',
        email: 'test@test.com',
        role: 'admin'
      )

      assert_equal user.valid?, true
    end
  end
end
