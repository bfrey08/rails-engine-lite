require 'rails_helper'

describe "Items API" do
  before(:each) do
    create_list(:merchant, 3)
    create_list(:item, 3)
  end
  it "can make a list of all items" do
    get "/api/v1/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end
  it "can get one item information" do
    get "/api/v1/items/#{Item.first.id}"

    expect(response).to be_successful

    items = JSON.parse(response.body)
    expect(items["name"]).to eq("Fun Item")
  end
  it "can create an item" do

    item = {name: 'new item',
            description: 'new description',
            unit_price: 50.0,
            merchant_id: Merchant.first.id}
    headers = {'CONTENT_TYPE' => 'application/json'}

    post "/api/v1/items", headers: headers, params: JSON.generate(item: item)

    expect(response).to be_successful

    expect(Item.all.count).to eq(4)
  end
  it "can update an item" do

    item = {name: 'updated item',
            description: 'updated description'}

    headers = {'CONTENT_TYPE' => 'application/json'}

    patch "/api/v1/items/#{Item.first.id}", headers: headers, params: JSON.generate(item: item)

    expect(response).to be_successful

    expect(Item.all.count).to eq(3)
    expect(Item.first.name).to eq('updated item')
  end
  it "can destoy an item" do
    delete "/api/v1/items/#{Item.second.id}"

    expect(response).to be_successful

    expect(Item.all.count).to eq(2)
  end
end
