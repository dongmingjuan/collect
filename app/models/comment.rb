class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String
  field :star, type: String

  belongs_to :task
  belongs_to :article
  belongs_to :user
end
