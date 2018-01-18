json.extract! task, :id, :title, :addr, :boss_name, :mobile, :environment, :activity_decription, :status, :brand, :deadline, :end_time, :created_at, :updated_at
json.url task_url(task, format: :json)
