class AddActiveFlagToTrainerClient < ActiveRecord::Migration[7.0]
  def change
    change_table :trainer_clients do |t|
      t.boolean :active, default: true, null: false
    end
  end
end
