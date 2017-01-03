class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.references :conversations, foreign_key: true

      t.timestamps
    end
  end
end
