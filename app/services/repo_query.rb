class RepoQuery

  def initialize(username, repo)
    @connection = Faraday.new('https://api.github.com')
    @username = username
    @repo = repo
    @auth = "?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}"
  end

  def commits
    commits_response = @connection.get("/repos/#{@username}/#{@repo}/commits#{@auth}")
    commits = JSON.parse(commits_response.body)
  end
end