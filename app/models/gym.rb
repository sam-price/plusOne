class Gym < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :city
end
