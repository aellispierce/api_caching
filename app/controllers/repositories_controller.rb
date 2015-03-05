class RepositoriesController < ApplicationController

  def index
  end

  def show
    @profile = Profile.find_by_username(params[:username]) ||
      Profile.create_from_username(params[:username])
      if Repository.where(profile_id: @profile.id).count > 0 &&
        Repository.where(profile_id: @profile.id).first.updated_at > (Time.now - 2.hours)
        @repositories = Repository.where(profile_id: @profile.id)
      else
        Repository.where(profile_id: @profile.id).delete_all
        @repositories = RepositoryList.create_list(params[:username], @profile.id)
      end
  end

end
