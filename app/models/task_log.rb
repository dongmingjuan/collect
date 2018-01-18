class TaskLog
  include Mongoid::Document
  include Mongoid::Timestamps
  field :sender, type: String
  field :acceptor, type: String
  field :task_title, type: String
  field :start_time, type: Date
  field :end_time, type: Date
  field :status, type: Integer

  has_and_belongs_to_many :users
end
