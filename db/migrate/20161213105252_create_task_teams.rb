class CreateTaskTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :task_teams do |t|
      t.references :friends, foreign_key: true
      t.references :my_tasks, foreign_key: true
      t.references :conversations, foreign_key: true

      t.timestamps
    end
  end
end
