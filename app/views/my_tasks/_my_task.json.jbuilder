json.extract! my_task, :id, :title, :description, :status, :deadline, :conversations_id, :created_at, :updated_at
json.url my_task_url(my_task, format: :json)