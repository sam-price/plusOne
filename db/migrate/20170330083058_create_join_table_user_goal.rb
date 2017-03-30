class CreateJoinTableUserGoal < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :goals do |t|
      t.index [:user_id, :goal_id]
    end
  end
end
