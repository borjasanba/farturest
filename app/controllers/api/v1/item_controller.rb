class Api::V1::ItemController < ApplicationController

  def getItemsByLocation
    @lat = 40.42222
    @long = -3.70000
    @items = Item.select("id, (6371 * acos (cos (radians(#{@lat})) *
      cos( radians( latitude )) * cos( radians ( longitude ) - radians (#{@long}))
      + sin ( radians(#{@lat})) * sin( radians( latitude ) ))) as distance ").
      having("distance < 1000").order("distance")
    Rails.logger.info @items.first.distance
    render json: @items
  end

end
