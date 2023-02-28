class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :sets
      t.integer :reps
      t.text :notes
      t.references :client_workouts, null: false, foreign_key: true

      t.timestamps
    end
  end
end
