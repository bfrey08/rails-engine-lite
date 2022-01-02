class Api::V1::MerchantsSearchController < ApplicationController
  def show
    render json: Merchant.find_by(name: params[:name])
  end

end
