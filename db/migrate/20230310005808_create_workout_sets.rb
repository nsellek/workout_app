class CreateWorkoutSets < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_sets do |t|
      t.integer :weight
      t.integer :reps
      t.text :notes
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
