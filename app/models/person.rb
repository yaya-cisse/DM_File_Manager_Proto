class Person < ActiveRecord::Base
   attr_accessible :first_name, :last_name, :file, :file_id, :file_type
   # before_initialize :init

  def file
    @file ||= Fichier.find(self.file_id) if self.file_id
  end

  def file=(binary)
    unless self.file_id
      file_content = Fichier.new()
      self.file_id = file_content.id.to_s
    else
      file_content = Fichier.find(self.file_id)
    end
    file_content.content = Moped::BSON::Binary.new(:generic,binary)
    file_content.save
  end

  # private

  # def init
  #   self.file_id = Fichier.new().id
  # end

end
