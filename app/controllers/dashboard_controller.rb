class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @tics = Tic.page(params[:page])
  end

  def search
    @tics = SearchEngine.search(params[:query]).page(params[:page])
    render action: :index
  end
end