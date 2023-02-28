class CreateClientWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :client_workouts do |t|
      t.bigint :client_id, null: false
      t.bigint :trainer_id, null: false
      t.string :name

      t.timestamps
    end

    add_foreign_key :client_workouts, :users, column: :trainer_id
    add_foreign_key :client_workouts, :users, column: :client_id
    add_index :client_workouts, [:trainer_id, :client_id], unique: true
  end
end
