class Person
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :image, type: Moped::BSON::Binary
  field :file, type: Moped::BSON::Binary
end
