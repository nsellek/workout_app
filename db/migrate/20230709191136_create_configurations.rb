class CreateConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :configurations do |t|
      t.integer :trainer_id
      t.jsonb :settings, null: false, default: {}

      t.timestamps
    end
  end
end
