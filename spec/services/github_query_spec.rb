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

    it "returns the user profile" do
      profile = @query.profile

      expect(profile["login"]).to eq("maxglassie")
      expect(profile["url"]).to eq("https://api.github.com/users/maxglassie")
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

      expect(events.first["actor"]["login"]).to eq("maxglassie")
    end

    it "returns organizations" do
      organizations = @query.organizations

      expect(organizations).to eq([])
    end

    it "returns number of starred repos" do
      starred = @query.starred

      expect(starred.count).to eq(4)
      expect(starred.first["name"]).to eq("reddit-graph-analysis")
    end

    it "returns received events" do
      received_events = @query.received_events

      expect(received_events.first["public"]).to eq(true)
    end

    it "returns following" do
      following = @query.following

      expect(following.first["login"]).to eq("Carmer")
    end
  end
end