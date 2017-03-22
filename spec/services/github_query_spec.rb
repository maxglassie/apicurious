require 'rails_helper'


describe GithubQuery do
  attr_reader :query

  before(:each) do
    uid = 19553401
    username = "maxglassie"
    token = "token"

    user = User.create(uid: uid, username: username, token: token)
    @query = GithubQuery.new(user)
  end

  describe "github query service calls the github API", :vcr do
    it "initializes a Faraday connection" do
      connection = @query.connection

      expect(connection.url_prefix.to_s).to eq('https://api.github.com/')
      expect(@query.auth).to eq("?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}")
      expect(@query.user.username).to eq("maxglassie")
    end

    it "returns followers" do
      followers = @query.followers

      expect(followers.first['login']).to eq("Carmer")
    end

    it "returns repos" do
      repos = @query.repos

      expect(repos.first["name"]).to eq("advanced_enums")
      expect(repos.first["owner"]["login"]).to eq("maxglassie")
    end

    it "returns events" do
      events = @query.events

      expect(events.first).to eq("advanced_enums")
      expect(events.first["owner"]["login"]).to eq("maxglassie")
    end

    #repos
    #events
    #profile
  end
end