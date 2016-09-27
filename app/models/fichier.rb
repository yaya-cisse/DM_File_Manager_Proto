require 'couchbase/model'

class Fichier < Couchbase::Model
  attribute :parent
  attribute :content
end
