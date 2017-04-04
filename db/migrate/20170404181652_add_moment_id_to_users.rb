class AddMomentIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :moment, foreign_key: true
  end
end
