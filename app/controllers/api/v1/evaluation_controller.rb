class Api::V1::EvaluationController < ApplicationController
  before_action :doorkeeper_authorize!

  def getEvaluationsByProfile
      render json: Evaluation.where(target_profile_id: params[:target_profile_id])
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
