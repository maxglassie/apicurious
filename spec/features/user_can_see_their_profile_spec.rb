require 'rails_helper'

RSpec.feature "user can view their profile page", :vcr do
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
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@activerecord_user)
  end

  scenario "user sees all their followers" do
    #as a user, I visit my profile page
    visit profile_path(@activerecord_user)

    #and I see a list of followers
    expect(page).to have_content("Carmer")
    expect(page).to have_content("briancaffey")
  end

  scenario "user sees all their repos" do
    visit profile_path(@activerecord_user)

    expect(page).to have_content("apicurious")
    expect(page).to have_content("battleship")
  end

  scenario "user sees all their following" do
    visit profile_path(@activerecord_user)

    expect(page).to have_content("Carmer")
    expect(page).to have_content("briancaffey")
  end

xscenario "user sees their organizations" do
    visit profile_path(@activerecord_user)

    expect(page).to have_content("APICuriousTest")
  end
end 