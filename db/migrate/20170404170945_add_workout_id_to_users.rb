class AddWorkoutIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :workout, foreign_key: true
    add_reference :users, :fitness_level, foreign_key: true
  end
end
