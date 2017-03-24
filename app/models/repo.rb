class Repo
  attr_reader :name, :login, :query

  def initialize(data)
    @data = data
    @name = data["name"]
    @login = data["owner"]["login"]
    @query = RepoQuery.new(@login, @name)
  end

  def commits
    @query.commits.map do |commit|
      Commit.new(commit)
    end
  end
end