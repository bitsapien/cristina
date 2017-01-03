class TaskTeam < ApplicationRecord
  belongs_to :friends
  belongs_to :my_tasks
  belongs_to :conversations
end
