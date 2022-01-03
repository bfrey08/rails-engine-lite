require 'rails_helper'

describe Item do
  before(:each) do
    create_list(:merchant, 3)
    create_list(:item, 3)
  end

  it {should belong_to :merchant}

  it "item search function" do


    expect(Item.search_name("Fun").count).to eq(3)
  end
end
