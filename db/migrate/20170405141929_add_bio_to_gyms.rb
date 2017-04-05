class AddBioToGyms < ActiveRecord::Migration[5.0]
  def change
    add_column :gyms, :bio, :text
  end
end
