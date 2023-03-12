class CreateWorkoutDays < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_days do |t|
      t.references :workout_week, null: false, foreign_key: true

      t.timestamps
    end
  end
end
