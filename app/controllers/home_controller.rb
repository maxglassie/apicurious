class HomeController < ApplicationController
  def show
    @client_id = ENV["client_id"]
  end
end