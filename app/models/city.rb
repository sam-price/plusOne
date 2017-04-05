class City < ApplicationRecord
  # simple associations
  has_many :users
  has_many :gyms
end
