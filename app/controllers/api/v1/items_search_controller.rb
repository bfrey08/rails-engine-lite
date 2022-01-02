class Api::V1::ItemsSearchController < ApplicationController
  def index
    render json: Item.where(name: params[:name])
  end

end
