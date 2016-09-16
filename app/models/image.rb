class Image
  include Mongoid::Document
  field :parent, type: String
  field :content, type: Moped::BSON::Binary
end
