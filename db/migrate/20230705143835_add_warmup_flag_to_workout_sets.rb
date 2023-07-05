class AddWarmupFlagToWorkoutSets < ActiveRecord::Migration[7.0]
  def change
    add_column :workout_sets, :warmup, :boolean, default: false
  end
end
