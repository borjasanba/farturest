class Api::V1::ProfileController < ApplicationController
  before_action :doorkeeper_authorize!

  def myProfile
    #render json: User.find(doorkeeper_token.resource_owner_id).as_json
    render json: Profile.where(user_id: doorkeeper_token.resource_owner_id).as_json
  end

  def getProfileById
      render json: Profile.find_by_id(params[:id])
  end

  def create_update
    @profile = Profile.where(user_id: doorkeeper_token.resource_owner_id).first_or_initialize
    @profile.update_attributes(profile_params)
    respond_to do |format|
      if @profile.save
            format.json {render json: @profile, status: :created}
      else
            format.json {render json: @profile.errors, status: :unprocessable_entity}
      end
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:name, :age, :speciality)
    end
end