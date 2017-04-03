class CreateFitnessLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :fitness_levels do |t|
      t.string :skill

      t.timestamps
    end
  end
end
