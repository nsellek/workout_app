class CreateWorkoutMaxes < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_maxes do |t|
      t.integer :workout_id, index: true
      t.integer :client_id, index: true
      t.string :amount, default: '0'
      t.string :projected_max, default: '0'
      t.jsonb :history, default: []

      t.timestamps
    end

    add_index :workout_maxes, [:workout_id, :client_id]
  end
end
