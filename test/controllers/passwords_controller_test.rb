require "test_helper"

describe PasswordsController do
  fixtures :users

  let(:user) { users(:admin) }

  describe 'edit' do

    it 'renders the change password page' do
      # user = users(:admin)
      get :edit, id: user.id

      must_render_template :edit
    end
  end

  describe 'update' do

    it 'update the user password' do
      put :update, { id: user.id, user:
        { password: 'q1w2e3r4',
          password_confirmation: 'q1w2e3r4' }}

      must_respond_with :redirect
    end
  end
end
