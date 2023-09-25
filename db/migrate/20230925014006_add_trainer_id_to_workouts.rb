class AddTrainerIdToWorkouts < ActiveRecord::Migration[7.0]
  def change
    change_table :workouts do |t|
      t.integer :trainer_id, index: true
    end
  end
end
