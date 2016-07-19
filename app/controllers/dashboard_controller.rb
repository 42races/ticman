class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @tics = Tic.page(params[:page])
  end

  def search
    @results = SearchEngine.search(params[:query])
    render action: :index
  end
end