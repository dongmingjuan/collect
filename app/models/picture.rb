class Picture
  include Mongoid::Document
  include Mongoid::Timestamps

  # 图片来源URL地址
  field :picurl, type: String

  belongs_to :article
end
