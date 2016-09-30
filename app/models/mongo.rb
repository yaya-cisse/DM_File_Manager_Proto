module MongoManager
  def my_file
    @my_file ||= Fichier.find(self.file_id) if self.file_id
  end
  def my_file=(binary)
    unless self.file_id
      file_content = Fichier.new()
      self.file_id = file_content.id.to_s
    else
      file_content = Fichier.find(self.file_id)
    end
    file_content.content = Moped::BSON::Binary.new(:generic,binary)
    file_content.save
  end
  class Fichier
    include Mongoid::Document
    field :content, type: Moped::BSON::Binary
  end
end
