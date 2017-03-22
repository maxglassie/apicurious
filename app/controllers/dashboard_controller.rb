class DashboardController < ApplicationController
  before_action :authorize!

  def show
    @user = current_user
    @query = GithubQuery.new(@user)
    @query.followers
  end
end
