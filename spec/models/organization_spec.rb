require 'rails_helper'

describe Organization do
  
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
    @organization = @user.query.organizations.first
  end

  describe "#organization", :vcr do
    xit 'it takes an organization data hash as an argument' do
      organization  = Organization.new(@organization)
      binding.pry
      expect(organization.class).to eq(Organization)
    end

    xit 'it returns the organization name' do
      organization  = Organization.new(@organization)

      expect(organization).to eq("maxglassie")
    end
  end

end