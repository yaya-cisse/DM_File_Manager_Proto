require 'singleton'
module CouchbaseMan
  # after_save :save_file
  class CouchbaseManager
    extend ActiveSupport::Concern
    include Singleton

    def connection
      @conn ||= Couchbase.connect(:hostname => "localhost", :port => 8091,:password => 'test', :bucket => "proto_database")
    end

    def my_file
      @my_file ||= (
          CouchbaseManager.instance.connection.get("PERSON:#{self.first_name}")
      )
      #Fichier.find(self.file_id) if self.file_id
    end

    def my_file=(binary)
      @my_file = binary
      CouchbaseManager.instance.connection.set("PERSON:#{self.first_name}", @my_file, :format => :plain)
      # unless self.file_id
      #   file_content = Fichier.create()
      #   self.file_id = file_content.id.to_s
      # else
      #   file_content = Fichier.find_by_id(self.file_id)
      # end
      #file_content.content = Couchbase::Transcoder::Marshal.dump(binary, 0x1000)
      #file_content.save
    end

    private

    # def init
    #   self.file_id = Fichier.new().id
    # end
    #

    def save_file
      #CouchbaseManager.instance.connection.run do |conn|
        CouchbaseManager.instance.connection.set("PERSON:#{self.first_name}", @my_file, :format => :plain)
      #end
    end
  end
end
