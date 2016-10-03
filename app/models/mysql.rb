class MysqlManager < ActiveRecord::Base
  attr_accessible :content

  def get_file
    @my_file ||= Fichier.find(self.file_id) if self.file_id
  end

  def set_file=(binary)
    unless self.file_id
      file_content = Fichier.create()
      self.file_id = file_content.id
    else
      file_content = Fichier.find(self.file_id)
    end
    file_content.content = binary
    file_content.save
  end

  class Fichier < ActiveRecord::Base
    attr_accessible :content
  end

  private

end
