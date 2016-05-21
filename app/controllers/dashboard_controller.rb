class DashboardController < ApplicationController
  def index
    @tics = Tic.page(params[:page])
  end
end