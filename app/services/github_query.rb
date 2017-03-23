class GithubQuery
  attr_reader :connection, :auth, :username

  def initialize(username)
    @connection = Faraday.new('https://api.github.com')
    @username = username
    @auth = "?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}"
  end

  def profile
    profile_response = @connection.get("/users/#{@username}#{@auth}")
    profile = JSON.parse(profile_response.body)
  end

  def followers
    followers_response = @connection.get("/users/#{@username}/followers#{@auth}")
    followers = JSON.parse(followers_response.body)
  end

  def repos
    repos_response = @connection.get("/users/#{@username}/repos#{@auth}")
    repos = JSON.parse(repos_response.body)
  end

  def events
    events_response = @connection.get("/users/#{@username}/events#{@auth}")
    events = JSON.parse(events_response.body)
  end

  def organizations
    orgs_response = @connection.get("/users/#{@username}/orgs#{@auth}")
    organizations = JSON.parse(orgs_response.body)
  end

  def starred
    starred_response = @connection.get("/users/#{@username}/starred#{@auth}")
    starred = JSON.parse(starred_response.body)
  end

  def received_events
    received_events_response = @connection.get("/users/#{@username}/received_events#{@auth}")
    received = JSON.parse(received_events_response.body)
  end

  def following
    following_response = @connection.get("/users/#{@username}/following#{@auth}")
    following = JSON.parse(following_response.body)
  end
end