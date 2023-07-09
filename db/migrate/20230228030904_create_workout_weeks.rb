class CreateWorkoutWeeks < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_weeks do |t|
      t.bigint :client_id, null: false
      t.bigint :trainer_id, null: false
      t.string :name

      t.timestamps
    end

    add_foreign_key :workout_weeks, :accounts, column: :trainer_id
    add_foreign_key :workout_weeks, :accounts, column: :client_id
    add_index :workout_weeks, [:trainer_id, :client_id]
  end
end
