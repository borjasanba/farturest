class Api::V1::ProfileController < ApplicationController
  before_action :doorkeeper_authorize!

  def myProfile
    @profile = Profile.where(user_id: doorkeeper_token.resource_owner_id)
    respond_to do |format|
        format.json { render :json => @profile.as_json(:only => [:id, :name, :age, :speciality, :gender, :avatar], :methods => [:avatar_url, :num_evaluations, :num_items])}
    end
  end

  def getProfileById
    @profile = Profile.where(id: params[:id])
    respond_to do |format|
        format.json { render :json => @profile.as_json(:only => [:id, :name, :age, :speciality, :gender, :avatar], :methods => [:avatar_url, :num_evaluations, :num_items])}
    end
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

  def update_avatar
	   @profile = Profile.where(user_id: doorkeeper_token.resource_owner_id).first_or_initialize
	    avatar = params[:file]

	     attachment = {
         :filename => avatar.original_filename,
         :type => avatar.content_type,
         :headers => avatar.headers,
         :tempfile => avatar.tempfile
       }
	     @profile.update_attribute(:avatar, ActionDispatch::Http::UploadedFile.new(attachment))

	     respond_to do |format|
         if @profile.save
            format.json {render json: @profile, status: :created}
         else
            format.json {render json: @profile.errors, status: :unprocessable_entity}
         end
       end
  end

  def myAvatar
	   @profile = Profile.where(user_id: doorkeeper_token.resource_owner_id).first_or_initialize

	   respond_to do |format|
		     format.json { render :json => @profile.as_json(:only => [:id, :avatar], :methods => [:avatar_url])}
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:name, :age, :speciality)
    end

end
