class RepositoryList

  def self.create_list(username, profile_id)
    profile = nil
    response = HTTParty.get(
    "https://api.github.com/users/anellis/repos?sort=updated",
    :headers => {"Authorization" => "token #{ENV['GITHUB_TOKEN']}",
    "User-Agent" => "anyone"
  }
  )
    @repositories = response.map do |r|
      Repository.create(
      name: r["name"],
      url: r["url"],
      number_of_forks: r["forks_count"].to_i,
      number_of_stars: r["stargazers_count"].to_i,
      profile_updated_at: r["updated_at"].to_datetime,
      language: r["language"],
      profile_id: profile_id
    )
  end
  @repositories
end


end
