class CreateTrainerClients < ActiveRecord::Migration[7.0]
  def change
    create_table :trainer_clients do |t|
      t.bigint :trainer_id, null: false
      t.bigint :client_id, null: false

      t.timestamps
    end

    add_foreign_key :trainer_clients, :users, column: :trainer_id
    add_foreign_key :trainer_clients, :users, column: :client_id
    add_index :trainer_clients, [:trainer_id, :client_id], unique: true
  end
end
