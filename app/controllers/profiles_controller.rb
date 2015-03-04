class ProfilesController < ApplicationController


  def create
    Profile.create(profile_params)
  end


  private
  
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :party)
  end
end
