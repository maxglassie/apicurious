require 'rails_helper'

describe Follower do
  attr_reader :query

  before(:each) do
    uid = 19553401
    username = "maxglassie"
    token = "token"

    user = User.create(uid: uid, username: username, token: token)
    @query = GithubQuery.new(user)
  end

  describe "#follower", :vcr do
    xit 'takes a github query object as an argument' do
      follower  = Follower.new(@query)

      expect(follower.query.user.username).to eq("maxglassie")
    end

    it 'follower.all returns an array of follower objects' do
      followers = Follower.all

      expect(followers.first.username).to eq("Carmer")
    end



  end

end