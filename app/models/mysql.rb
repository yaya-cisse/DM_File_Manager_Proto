class MysqlManager

  def self.get_file(file_id)
    @my_file ||= Fichier.find(file_id).content if file_id
  end

  def self.set_file(file_id, binary)
    unless file_id
      @file = Fichier.create()
      file_id = @file.id
    else
      @file = Fichier.find(file_id)
    end
    @file.content = binary
    file_id
  end

  def self.save_file
    @file.save
  end

  def self.destroy_file(id)
    if id
      file = Fichier.find(id)
      file.destroy
    end
  end

  class Fichier < ActiveRecord::Base
    attr_accessible :content
  end
end
