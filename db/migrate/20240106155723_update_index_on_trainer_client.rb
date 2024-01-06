class UpdateIndexOnTrainerClient < ActiveRecord::Migration[7.0]
  def change
    remove_index :trainer_clients, column: [:trainer_id, :client_id]
    add_index :trainer_clients, [:trainer_id, :client_id, :active]
  end
end
