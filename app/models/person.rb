class Person < ActiveRecord::Base
   attr_accessible :first_name, :last_name, :file, :file_id, :file_type
   # before_initialize :init
   after_destroy :destroy_file

  def file
    @file ||= Fichier.find(self.file_id) if self.file_id
  end

  def file=(binary)
    unless self.file_id
      file_content = Fichier.create()
      self.file_id = file_content.id.to_s
    else
      file_content = Fichier.find_by_id(self.file_id)
    end
    file_content.content = Couchbase::Transcoder::Marshal.dump(binary, 0x1000)
    file_content.save
  end

  private

  # def init
  #   self.file_id = Fichier.new().id
  # end
  #
  def destroy_file
    if self.file_id
      file_content = Fichier.find(self.file_id)
      file_content.delete
    end
  end

end
