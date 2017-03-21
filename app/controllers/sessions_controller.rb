class SessionsController < ApplicationController
    def create
      code = params['code']
      client_id = ENV['client_id']
      client_secret = ENV['client_secret']

      response  = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}")
      access_token = response.body.split(/\W+/)[1]

      oauth_response = Faraday.get("https://api.github.com/user?access_token=#{access_token}")
      data = JSON.parse(oauth_response.body)

      
    end
end