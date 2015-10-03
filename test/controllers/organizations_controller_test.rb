require 'test_helper'

describe OrganizationsController do
  it 'Renders new organization page' do
    get :new
    must_respond_with :success
    must_render_template :new
    assert assigns(:organization)
  end
end
