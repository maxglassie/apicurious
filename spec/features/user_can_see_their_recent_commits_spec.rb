require 'rails_helper'

RSpec.feature "user can view their recent commits page", :vcr do
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

  scenario "user sees their repos and their commits" do
    visit commit_path(@activerecord_user)

    save_and_open_page
    expect(page).to have_content("advanced_enums")
    expect(page).to have_content("working on change_indexes")
  end
end 