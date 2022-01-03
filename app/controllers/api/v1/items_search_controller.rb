class Api::V1::ItemsSearchController < ApplicationController
  def index
    item = Item.search_name(params[:name])
    render json: ItemSerializer.new(item)
  end

end
