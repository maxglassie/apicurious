class SessionsController < ApplicationController
    def create
      binding.pry
      code = params['code']
      client_id = ENV['client_id']
      client_secret = ENV['client_secret']

      response  = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}")
    end
end