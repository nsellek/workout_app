class CreateTrainerWidgets < ActiveRecord::Migration[7.0]
  def change
    create_table :trainer_widgets do |t|
      t.integer :trainer_id
      t.integer :widget_id
      t.integer :position
      t.jsonb :settings, null: false, default: {}

      t.timestamps
    end
    add_index :trainer_widgets, :trainer_id
    add_index :trainer_widgets, :widget_id
  end
end
