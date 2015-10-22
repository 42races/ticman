require "test_helper"

describe RegistrationMailer do

  let(:user) {
    u = User.build_new_user(
      name: 'test',
      email: 'test@test.com',
      role: 'admin')

    u.save
    u
  }

  it '#email_confirmation' do
    # RegistrationMailer.send(:new).email_confirmation(user.id)
    # assert user.email_confirmation_sent_at
  end
end
