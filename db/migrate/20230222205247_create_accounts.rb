class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :type, null: false, index: true

      t.timestamps
    end
  end
end
