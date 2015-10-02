class Api::V1::RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!, :except => [:create], :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json

  prepend_view_path 'app/views/devise'

  def create
    build_resource(sign_up_params)
    if resource.save
      sign_in resource
      render :status => 200,
             :json => { :success => true,
                        :info => "Registered",
                        :email => resource.email}
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => resource.errors }
    end
  end

end
