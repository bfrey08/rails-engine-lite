require 'rails_helper'

describe "Merchants API" do
  before(:each) do
    create_list(:merchant, 3)
    create_list(:item, 3)
  end
  it "can give a list of items based on a merchant" do
    get "/api/v1/merchants/#{Merchant.last.id}/items"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(1)
  end
end
