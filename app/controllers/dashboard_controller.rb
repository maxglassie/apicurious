class DashboardController < ApplicationController
  before_action :authorize!

  def show
    @presenter = GithubUser.new(current_user)
  end
end
