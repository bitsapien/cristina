class TaskDiscussion < ApplicationRecord
  belongs_to :my_tasks
  belongs_to :conversations
end
