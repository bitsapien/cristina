class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.text :body
      t.boolean :understood

      t.timestamps
    end
  end
end
