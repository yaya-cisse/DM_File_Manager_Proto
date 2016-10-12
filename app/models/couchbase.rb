require 'singleton'
require 'securerandom'

class CouchbaseManager
  include Singleton

  def connection
    @conn ||= Couchbase.connect(:hostname => "172.17.0.4", :port => 8091, :bucket => "proto_database")
  end

  def self.get_file(file_id)
    @my_file ||= (
        CouchbaseManager.instance.connection.get(file_id)
    )
  end

  def self.set_file(file_id, binary)
    @my_file = binary
    file_id = SecureRandom.uuid
    @file_key = file_id
    file_id
  end

  def self.save_file
    CouchbaseManager.instance.connection.set(@file_key, @my_file, :format => :plain)
  end

  def self.destroy_file(id)
    if id
      CouchbaseManager.instance.connection.delete(id)
    end
  end
end
