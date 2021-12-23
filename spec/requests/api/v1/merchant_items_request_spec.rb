require 'rails_helper'

describe "Merchants API" do
  before(:each) do
    create_list(:merchant, 3)
    create_list(:item, 3)
    binding.pry
  end
  it "sends a list of all merchants" do
    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(6)
  end
  it "finds one merchant with id" do
    get "/api/v1/merchants/#{Merchant.first.id}"
    merchant = JSON.parse(response.body)
    expect(merchant["name"]).to eq("John")
  end
end
