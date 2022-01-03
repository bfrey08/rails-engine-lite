class Item < ApplicationRecord
  belongs_to :merchant

  def self.search_name(q)
    where("name ILIKE ?", "%#{q}%")
  end

end
