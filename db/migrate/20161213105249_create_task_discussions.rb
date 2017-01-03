class CreateTaskDiscussions < ActiveRecord::Migration[5.0]
  def change
    create_table :task_discussions do |t|
      t.references :my_tasks, foreign_key: true
      t.references :conversations, foreign_key: true
      t.text :body
      
      t.timestamps
    end
  end
end
