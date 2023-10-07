class CreateWidgets < ActiveRecord::Migration[7.0]
  def change
    create_table :widgets do |t|
      t.string :name
      t.string :file_name
      t.text :description
      t.jsonb :settings, null: false, default: {}

      t.timestamps
    end
  end
end
