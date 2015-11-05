class Api::V1::EvaluationController < ApplicationController
  before_action :doorkeeper_authorize!

  def getEvaluationsByProfile
      @evaluations = Evaluation.where(target_profile_id: params[:target_profile_id]).joins(:source_profile)
      .select('evaluations.rate, evaluations.comment, evaluations.created_at, evaluations.target_profile_id, profiles.name')

      respond_to do |format|
          format.json { render :json => @evaluations.as_json(:only => [:rate, :comment, :created_at, :target_profile_id, :name])}
      end
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.source_profile_id = Profile.find_by(user_id: doorkeeper_token.resource_owner_id).id
    respond_to do |format|
      if @evaluation.save
            format.json {render json: @evaluation, status: :created}
      else
            format.json {render json: @evaluation.errors, status: :unprocessable_entity}
      end
    end
  end

  private
    def evaluation_params
      params.require(:evaluation).permit(:rate, :comment, :target_profile_id)
    end
end
