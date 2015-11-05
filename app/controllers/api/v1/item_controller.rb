class Api::V1::ItemController < ApplicationController
  before_action :doorkeeper_authorize!

  #def getItemsByLocation
  #  @lat = 40.42222
  #  @long = -3.70000
  #  @items = Item.select("id, (6371 * acos (cos (radians(#{@lat})) *
  #    cos( radians( latitude )) * cos( radians ( longitude ) - radians (#{@long}))
  #    + sin ( radians(#{@lat})) * sin( radians( latitude ) ))) as distance ").
  #    having("distance < 1000").order("distance")
  #  Rails.logger.info @items.first.distance
  #  render json: @items
  #end
  def getItemsByProfile
    @items = Item.where(profile_id: params[:profileId]).joins(:category).select('items.*, categories.name')
    respond_to do |format|
        format.json { render :json => @items.as_json(:only => [:id, :profile_id, :text_short, :text_long, :price, :picture, :name], :methods => [:picture_url])}
    end
  end

  def create
    @item = Item.new
    @item.profile_id = Profile.find_by(user_id: doorkeeper_token.resource_owner_id).id
    @item.update_attributes(item_params)

    picture = params[:file]

     attachment = {
       :filename => picture.original_filename,
       :type => picture.content_type,
       :headers => picture.headers,
       :tempfile => picture.tempfile
     }
    @item.update_attribute(:picture, ActionDispatch::Http::UploadedFile.new(attachment))

    respond_to do |format|
      if @item.save
          format.json {render json: @item, status: :created}
      else
          format.json {render json: @item.errors, status: :unprocessable_entity}
      end
    end
  end

  private
    def item_params
      params.permit(:text_long, :text_short)
    end
end
