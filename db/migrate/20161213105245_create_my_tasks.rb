class CreateMyTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :my_tasks do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.datetime :deadline
      t.references :conversations, foreign_key: true

      t.timestamps
    end
  end
end
