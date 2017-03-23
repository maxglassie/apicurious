require 'rails_helper'

describe Follower, :vcr do
  attr_reader :user

  before(:each) do
    uid = 19553401
    username = "maxglassie"
    token = "token"

    activerecord_user = User.create(uid: uid, username: username, token: token)
    @user = GithubUser.new(activerecord_user)
    @follower = @user.query.followers.first
  end

  describe "#follower", :vcr do
    it 'it takes a follower data hash as an argument' do
      follower  = Follower.new(@follower)

      expect(follower.class).to eq(Follower)
    end

    it 'it returns the username as login' do
      follower  = Follower.new(@follower)

      expect(follower.login).to eq("Carmer")
    end

    it 'it has a method repos' do
      follower  = Follower.new(@follower)

      expect(follower.repos.first.name).to eq("1508-task-manager")
    end
  end

end