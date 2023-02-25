class CreateInviteTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :invite_tokens do |t|
      t.string :token, null: false
      t.bigint :trainer_id, null: false

      t.timestamps
    end

    add_foreign_key :invite_tokens, :users, column: :trainer_id
    add_index :invite_tokens, :token
    add_index :invite_tokens, :trainer_id
    add_index :invite_tokens, [:trainer_id, :token]
  end
end
