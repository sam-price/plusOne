class CreateJoinTableUserGym < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :gyms do |t|
      t.index [:user_id, :gym_id]
    end
  end
end
