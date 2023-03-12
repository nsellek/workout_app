class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :sets
      t.string :reps
      t.string :weight
      t.text :notes
      t.references :workout_day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
