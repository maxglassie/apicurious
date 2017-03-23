require 'rails_helper'

describe Repo do

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
    @repo = @user.repos.first
  end

  describe "#repo", :vcr do
    it 'it takes a repo data hash as an argument' do
      repo  = Repo.new(@repo)

      expect(repo.class).to eq(Repo)
    end

    it 'it returns the repo name as name' do
      repo  = Repo.new(@repo)

      expect(repo.name).to eq("advanced_enums")
    end
  end

end