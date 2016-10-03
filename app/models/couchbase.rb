require 'singleton'
class CouchbaseManager
  include Singleton

  def connection
    @conn ||= Couchbase.connect(:hostname => "localhost", :port => 8091,:password => 'test', :bucket => "proto_database")
  end

  def get_file
    @my_file ||= (
        CouchbaseManager.instance.connection.get("PERSON:#{self.first_name}")
    )
  end

  def set_file=(binary)
    @my_file = binary
    CouchbaseManager.instance.connection.set("PERSON:#{self.first_name}", @my_file, :format => :plain)
  end

  private

  def save_file
    CouchbaseManager.instance.connection.set("PERSON:#{self.first_name}", @my_file, :format => :plain)
  end
end
