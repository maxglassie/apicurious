require 'rails_helper'

describe Commit do

  before(:each) do
    uid = 19553401
    username = "maxglassie"
    name = "Max Glassie"
    token = ENV['access_token']
    image = 'https://avatars2.githubusercontent.com/u/19553401?v=3&s=460'

    @activerecord_user = User.create(uid: uid,
                                                            username: username,
                                                            token: token,
                                                            image: image,
                                                            name: name)
    @user = GithubUser.new(@activerecord_user)
    @commit = @user.repos.first.query.commits.first
  end

  describe "#commit", :vcr do
    it 'it takes a commit data hash as an argument' do
      commit  = Commit.new(@commit)

      expect(commit.class).to eq(Commit)
    end

    it 'it returns the author name' do
      commit  = Commit.new(@commit)

      expect(commit.commit["author"]["name"]).to eq("Max Glassie")
    end

    it 'it returns the commit message' do
      commit  = Commit.new(@commit)

      expect(commit.commit["message"]).to eq("working on change_indexes")
    end
  end

end