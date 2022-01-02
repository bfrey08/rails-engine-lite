class Api::V1::MerchantItemsController < ApplicationController
  def index
    render json: Merchant.find(params[:merchant_id]).items
  end

end



# Items:
# get all items
# get one item
# create an item
# edit an item
# delete an item
# get the merchant data for a given item ID
