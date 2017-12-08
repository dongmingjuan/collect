class Picture
  include Mongoid::Document
  include Mongoid::Timestamps
  # 图片来源URL地址
  mount_uploader :image, AvatarUploader
  # 图片来源地址
  field :origin_url, type: String

  belongs_to :article
end
