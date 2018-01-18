json.extract! task_log, :id, :sender, :acceptor, :task_title, :start_time, :end_time, :status, :created_at, :updated_at
json.url task_log_url(task_log, format: :json)
