require "test_helper"

describe RegistrationsController do
  it "should render the new page" do
    get :new
    assert_response :success
    must_render_template :new
    assert_equal assigns(:user).new_record?, true
  end

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
    assert assigns(:user).email_confirmation_token.present?
  end

end
