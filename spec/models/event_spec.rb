require 'rails_helper'

describe Event do
  
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
    @event = @user.events.first
  end

  describe "#event", :vcr do
    it 'it takes an event data hash as an argument' do
      event  = Event.new(@event)

      expect(event.class).to eq(Event)
    end

    it 'it returns the event name as' do
      event  = Event.new(@event)

      expect(event.actor["login"]).to eq("maxglassie")
    end
  end

end