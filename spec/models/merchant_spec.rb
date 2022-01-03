require 'rails_helper'

describe Merchant do
  before(:each) do
    create_list(:merchant, 3)
    create_list(:item, 3)
  end

  it {should have_many :items}

  it "item search function" do


    expect(Merchant.search_name("John")).to be_a(Merchant)
  end
end
