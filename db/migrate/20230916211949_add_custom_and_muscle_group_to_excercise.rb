class AddCustomAndMuscleGroupToExcercise < ActiveRecord::Migration[7.0]
  def change
    change_table :exercises do |t|
      t.boolean :client_choice
      t.references :muscle_group
    end
  end
end
