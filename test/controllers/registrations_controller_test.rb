require "test_helper"

describe RegistrationsController do
  fixtures :users

  it "should render the new page" do
    get :new
    assert_response :success
    must_render_template :new
    assert_equal assigns(:user).new_record?, true
  end

  describe 'Registrations and confirmation' do
    it "should create a organization admin user" do
      post :create, user: {
        name: 'Foo',
        email: 'test@test.com'
      }

      assert_response :success
      must_render_template :create
      assert_equal false, assigns(:user).new_record?
      assert_equal true,  assigns(:user).admin?
      assert_equal 'Foo', assigns(:user).name
      assert_equal 'test@test.com', assigns(:user).email
      # set email confirmation token
      assert assigns(:user).email_confirmation_token.present?
    end

    it 'should sent an email confirmation' do
      post :create, user: {
        name: 'Foo',
        email: 'test@test.com'
      }

      assert assigns(:user).reload.email_confirmation_sent_at > 1.minute.ago
    end

    it 'should render the info page if the confirmation token is wrong' do
      user = users(:admin)
      get :confirm_email, {
        email_confirmation_token: Service.reference_code('test@test.com')
      }

      assert_response :success
      must_render_template :wrong_confirmation_token
    end

    it 'should redirect to change password page' do
      user = users(:admin)
      user.update_attribute(:email_confirmation_token, Service.reference_code(user.email))

      get :confirm_email, {
        email_confirmation_token: user.email_confirmation_token
      }

      must_respond_with :redirect
      assert_equal response.redirect_url, edit_password_url(user)
    end

    it 'should redirect to root url if email already confimed' do
      user = users(:admin)
      user.update_attribute(:email_confirmation_token, Service.reference_code(user.email))
      user.confirm_email!

      get :confirm_email, {
        email_confirmation_token: user.email_confirmation_token
      }

      must_respond_with :redirect
      assert_equal response.redirect_url, root_url
    end
  end
end
