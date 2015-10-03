class OrganizationsController < ApplicationController

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @email = params[:email]
    user = User.new(email: params[:email])

    if !(user.save && @organization.save)
      render :new
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end

end
