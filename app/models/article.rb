class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  # 每页默认显示记录数
  paginates_per 3

  # 文章标题
  field :title, type: String
  # 文章内容
  field :content, type: String
  # 文章来源
  field :from, type: String
  # 文章点击次数
  field :view_count, type: Integer

  has_and_belongs_to_many :labels
  has_many :pictures
  belongs_to :user
end
