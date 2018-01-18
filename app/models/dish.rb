class Dish
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :imgs, type: Array

  belongs_to :task
end
