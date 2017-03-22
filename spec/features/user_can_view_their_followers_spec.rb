require 'rails_helper'

RSpec.feature "on the profile page user can view all their followers", :vcr do
    before(:each) do
    uid = 19553401
    username = "maxglassie"
    token = ENV['access_token']

    @activerecord_user = User.create(uid: uid, username: username, token: token)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@activerecord_user)
  end

  scenario "user sees all their followers" do
    #as a user, I visit my profile page
    visit profile_path(@activerecord_user)

    #and I see a list of followers
    save_and_open_page
    expect(page).to have_content("Carmer")
    expect(page).to have_content("briancaffey")
  end
end