class Follower
  attr_reader :login, :avatar_url, :query

  def initialize(data)
    @login = data["login"]
    @avatar_url = data["avatar_url"]
    @url = data["url"]
    @query = GithubQuery.new(@login)
  end

  def repos
    @query.repos.map do |repo|
      Repo.new(repo)
    end
  end

  def events
    @query.events.map do |event|
      Event.new(event)
    end
  end

end