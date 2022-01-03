require 'rails_helper'

describe "Merchants API" do
  before(:each) do
    create_list(:merchant, 3)

  end
  it "sends a list of all merchants" do
    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true)
    merchants = merchants[:data]
    expect(merchants.count).to eq(3)
  end
  it "finds one merchant with id" do
    get "/api/v1/merchants/#{Merchant.first.id}"
    merchants = JSON.parse(response.body, symbolize_names: true)
    merchants = merchants[:data]
    expect(merchants[:attributes][:name]).to eq("John")
  end
end
