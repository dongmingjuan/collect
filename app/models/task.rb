class Task
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :addr, type: String
  field :boss_name, type: String
  field :mobile, type: String
  field :environment, type: Array
  field :activity_decription, type: String
  field :status, type: Integer
  field :brand, type: Array
  field :deadline, type: Date
  field :end_time, type: Date

  has_many :dishes
  has_many :merchants
  has_many :stores
  has_many :comments
end
