class GithubQuery
  attr_reader :followers, :connection, :auth, :user

  def initialize(current_user)
    @connection = Faraday.new('https://api.github.com')
    @user = current_user
    @auth = "?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}"
  end

  def profile
    profile_response = Faraday.get("https://api.github.com/users/#{@user.username}#{@auth}")
    profile = JSON.parse(profile_response.body)
  end

  def followers
    followers_response = @connection.get("/users/#{@user.username}/followers#{@auth}")
    followers = JSON.parse(followers_response.body)
  end

  def repos
    repos_response = Faraday.get("https://api.github.com/users/#{@user.username}/repos#{@auth}")
    repos = JSON.parse(repos_response.body)
  end

  def events
    events_response = Faraday.get("https://api.github.com/users/#{@user.username}/events#{@auth}")
    events = JSON.parse(events_response.body)
  end

end