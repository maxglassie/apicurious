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

    it '.followers returns an array of follower objects' do
      followers = @github_user.followers

      expect(followers.first.login).to eq("Carmer")
    end
  end

end