class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @tics = Tic.page(params[:page])
  end
end