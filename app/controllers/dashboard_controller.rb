class DashboardController < ApplicationController
  def index
    @tics = Tic.all
  end
end