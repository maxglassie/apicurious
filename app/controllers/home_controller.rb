class HomeController < ApplicationController
  def show
    #passing this variable to the views?
    @client_id = ENV["client_id"]
  end
end