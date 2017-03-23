class ProfileController < ApplicationController

  def show
    @presenter = GithubUser.new(current_user)
  end
end