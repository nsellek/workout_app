class ChangeWorkoutMaxToExerciseMax < ActiveRecord::Migration[7.0]
  def change
    rename_table :workout_maxes, :exercise_maxes
    rename_column :exercise_maxes, :workout_id, :exercise_id
  end
end
