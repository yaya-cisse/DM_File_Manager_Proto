require 'couchbase/model'

class Person < Couchbase::Model
  attribute :first_name
  attribute :last_name
  attribute :email
  attribute :notes
end
