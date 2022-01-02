class Api::V1::ItemMerchantController < ApplicationController
  def show
    render json: Merchant.find(params[:merchant_id])
  end
end
