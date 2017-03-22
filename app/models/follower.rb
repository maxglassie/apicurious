class Follower
  attr_reader :query

  def self.query
    user = current_user
    @query ||= GithubQuery.new(user)
  end

  def self.all
    query
  end

end