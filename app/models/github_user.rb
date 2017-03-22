class GithubUser
  attr_reader :user, :query

  def initialize(user)
    @user = user
    @query = GithubQuery.new(@user)
  end

  def followers
    @query.followers.map do |follower|
      Follower.new(follower)
    end
  end
end