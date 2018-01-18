class WxPublic
  include Mongoid::Document
  include Mongoid::Timestamps
  field :nickname, type: String
  field :manager, type: String
  field :alias, type: String

  has_and_belongs_to_many :users
end
