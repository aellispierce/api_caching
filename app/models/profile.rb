class Profile < ActiveRecord::Base
  validates :username, uniqueness: true


  def self.create_from_username(username)
    profile = nil
    response = HTTParty.get(
      "https://api.github.com/users/#{username}",
      :headers => {"Authorization" => "token #{ENV['GITHUB_TOKEN']}",
      "User-Agent" => "anyone"
      }
    )
    if response["login"]
      profile= Profile.create(
        body: response,
        username: response["login"],
        number_following: response["following"],
        location: response["location"],
        avatar_url: response["avatar_url"],
        company_name: response["company"],
        number_of_followers: response["followers"]
      )
    end
    profile
  end

  # def username
  #   @content["login"]
  # end
  #
  # def avatar_url
  #   @content["avatar_url"]
  # end
  #
  # def location
  #   @content["location"]
  # end
  #
  # def company_name
  #   @content["company"]
  # end
  #
  # def number_of_followers
  #   @content["followers"]
  # end
  #
  # def number_following
  #   @content["following"]
  # end

end
