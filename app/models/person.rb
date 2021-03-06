class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :file_type, :file_id, :file
  after_destroy :destroy_file

  def file
    @file ||= Fichier.find(self.file_id) if self.file_id
  end

  def file=(binary)
    unless self.file_id
      file_content = Fichier.create()
      self.file_id = file_content.id
    else
      file_content = Fichier.find(self.file_id)
    end
    file_content.content = binary
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
      file_content.destroy
    end
  end

end
