class DropChannelKeyFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :channel_key
  end
end
