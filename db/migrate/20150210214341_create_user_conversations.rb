class CreateUserConversations < ActiveRecord::Migration
  def change
    create_table :user_conversations do |t|
      t.references :user, index: true
      t.references :conversation, index: true
      t.boolean :read

      t.timestamps
    end
  end
end
