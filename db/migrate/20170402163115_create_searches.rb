class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :sports
      t.string :goals
      t.string :gyms
      t.string :city

      t.timestamps
    end
  end
end
