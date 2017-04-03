class AddCitiesToSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :cities, :string
  end
end
