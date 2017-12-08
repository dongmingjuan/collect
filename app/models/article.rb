class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search
  # 文章标题
  field :title, type: String
  # 文章内容
  field :content, type: String
  # 文章来源
  field :from, type: String
  # 文章点击次数
  field :view_count, type: Integer
  # 文章标签
  field :article_label, type: String

  has_and_belongs_to_many :labels
  has_many :pictures, dependent: :delete
  belongs_to :user
  # 全文搜索
  search_in :title, :content, :from, :view_count, :article_label

  after_create :update_content

  # 文章保存后将微信图片换成本地的图片
  def update_content
    pic_urls = self.content.scan(/(https:\/\/mmbiz.qpic.cn\S*wx_lazy=1)/)
    pic_urls.each do |pic_url|
      pic_url = pic_url[0]
      content = self.content
      upyun_pic = Picture.find_by(origin_url: pic_url).image_url
      self.update(content: content.gsub(pic_url,upyun_pic))
    end
  end

end
