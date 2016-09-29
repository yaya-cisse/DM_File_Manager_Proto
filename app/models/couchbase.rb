require 'singleton'

class CouchbaseManager
  include Singleton

  def connection
    @conn ||= Couchbase.connect(:hostname => "localhost", :port => 8091,:password => 'test', :bucket => "proto_database")
  end

end
