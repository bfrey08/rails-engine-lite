require 'rails_helper'

describe "Items Search API" do
  before(:each) do
    create_list(:merchant, 3)
    create_list(:item, 3)
  end
  it "can search for all items" do
    get "/api/v1/items/find_all?name=#{Item.first.name}"
    items = JSON.parse(response.body, symbolize_names: true)
    items = items[:data]
    expect(items.count).to eq(3)
    expect(items.first[:attributes]).to have_key(:description)
  end
end
