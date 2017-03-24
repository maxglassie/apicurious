class CommitController < ApplicationController

  def index
    @presenter = GithubUser.new(current_user)
  end
end