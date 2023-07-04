class AddCompletedFlagToWorkoutDay < ActiveRecord::Migration[7.0]
  def change
    add_column :workout_days, :completed, :boolean, default: false
  end
end
