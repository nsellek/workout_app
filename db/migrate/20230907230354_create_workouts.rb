class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :equipment
      t.references :muscle_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
