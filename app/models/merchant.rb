class Merchant
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  has_many :stores
end
