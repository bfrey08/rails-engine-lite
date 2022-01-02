require 'rails_helper'

describe "Merchants Search API" do
  before(:each) do
    create_list(:merchant, 3)
    #create_list(:item, 3)
  end
  it "can search for a merchant" do
    get "/api/v1/merchants/find?name=#{Merchant.first.name}"
    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant).to have_key(:name)
  end
end
