require 'rails_helper'

describe GithubUser do
  before(:each) do
    uid = 19553401
    username = "maxglassie"
    token = ENV['access_token']

    activerecord_user = User.create(uid: uid, username: username, token: token)
    @github_user = GithubUser.new(activerecord_user)
  end

  describe "#github user", :vcr do
    it 'takes a user as an argument' do
      expect(@github_user.user.username).to eq("maxglassie")
    end

    it 'has a github query object as an attribute' do
      expect(@github_user.query.class).to eq(GithubQuery)
    end

    it 'followers returns an array of follower objects' do
      followers = @github_user.followers

      expect(followers.first.login).to eq("Carmer")
    end

    it 'repos returns an array of repo objects' do
      repos = @github_user.repos

      expect(repos.first.name).to eq("advanced_enums")
    end

    it 'events returns an array of event objects' do
      events = @github_user.events

      expect(events.first.repo["name"]).to eq("maxglassie/apicurious")
    end

    it 'starred returns an array of starred repo objects' do
      starred = @github_user.starred

      expect(starred.first.name).to eq("reddit-graph-analysis")
    end

    it 'received_events returns an array of event objects' do
      received_events = @github_user.received_events

      expect(received_events.first.repo["name"]).to eq("alfosco/apicurious")
    end

    it 'following returns an array of follower objects' do
      following = @github_user.following

      expect(following.first.login).to eq("Carmer")
      expect(following.first.class).to eq(Follower)
    end
  end

end