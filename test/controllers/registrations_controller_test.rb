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
      organization_name: 'Foo',
      email: 'test@test.com'
    }

    assert_response :success
    must_render_template :create
    assert_equal assigns(:user).new_record?, false
    assert_equal assigns(:user).admin?, true
    assert_equal assigns(:user).name, 'Foo'
    assert_equal assigns(:user).email, 'test@test.com'
  end

end
