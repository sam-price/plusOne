class CreateJoinTableUserSport < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :sports do |t|
      t.index [:user_id, :sport_id]
    end
  end
end
