class RenameExerciseMaxToWorkoutMax < ActiveRecord::Migration[7.0]
  def change
    rename_table :exercise_maxes, :workout_maxes
    add_column :workout_maxes, :workout_id, :integer
  end
end
