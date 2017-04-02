class AddCityIdToGyms < ActiveRecord::Migration[5.0]
  def change
    add_reference :gyms, :city, foreign_key: true
  end
end
