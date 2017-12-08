class Picture
  include Mongoid::Document
  include Mongoid::Timestamps
  # 图片来源URL地址
   mount_uploader :image, AvatarUploader

  belongs_to :article
end
