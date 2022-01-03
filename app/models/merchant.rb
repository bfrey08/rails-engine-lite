class Merchant < ApplicationRecord
  has_many :items

  def self.search_name(q)
    where("name ILIKE ?", "%#{q}%").first
  end

end
