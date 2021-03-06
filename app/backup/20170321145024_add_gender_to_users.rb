class AddGenderToUsers < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      CREATE TYPE gender AS ENUM ('Male', 'Female', 'Other');
    SQL

    add_column :users, :gender, :gender, index: true
  end

  def down
    remove_column :users, :gender

    execute <<-SQL
      DROP TYPE gender;
    SQL
  end
end
