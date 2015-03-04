class Profile < ActiveRecord::Base
  validates :username, uniqueness: true
  before_create :parse

  def initialize(username)
    @username= username
  end

  def self.create_from_username(username)
    @content = HTTParty.get(
      "https://api.github.com/users/#{username}",
      :headers => {"Authorization" => "token #{ENV['GITHUB_TOKEN']}",
      "User-Agent" => "anyone"
      }
    )
    if @content["login"]
      Profile.create(body:@content)
    else
      nil
    end
  end
  #
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

  private
    def parse
      username = body["login"]
      number_following = body["following"]
      location = body["location"]
      avatar_url = body["avatar_url"]
      company_name = body["company"]
      number_of_followers = body["followers"]
    end
end
