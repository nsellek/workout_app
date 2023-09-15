class AddDeletedToWorkoutWeek < ActiveRecord::Migration[7.0]
  def change
    change_table :workout_weeks do |t|
      t.boolean :deleted, default: false
    end
  end
end
