class Label
  include Mongoid::Document
  include Mongoid::Timestamps
  # 标签名称
  paginates_per 1
  field :name, type: String
  # 标签使用次数
  field :used_count, type: Integer
  field :active, type: Boolean, default: false
  has_and_belongs_to_many :articles
end
