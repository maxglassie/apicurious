class GithubUser
  attr_reader :user, :query

  def initialize(user)
    @user = user
    @query = GithubQuery.new(@user.username)
  end

  def followers
    @query.followers.map do |follower|
      Follower.new(follower)
    end
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

  def starred
    @query.starred.map do |repo|
      Repo.new(repo)
    end
  end

  def received_events
    @query.received_events.map do |event|
      Event.new(event)
    end
  end

  def following
    @query.following.map do |follower|
      Follower.new(follower)
    end
  end

  def organizations
    @query.organizations.map do |organization|
      Organization.new(follower)
    end
  end
end