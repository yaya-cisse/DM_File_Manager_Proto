class Person < ActiveRecord::Base
   attr_accessible :first_name, :last_name, :image, :file
   after_save :image, :file

  def image
    Image.find_by(parent: self.first_name)
  end

  def image=(binary)
    Image.create(parent: self.first_name, content: Moped::BSON::Binary.new(:generic,binary))
  end

  def file
    Fichier.find_by(parent: self.first_name)
  end

  def file=(binary)
    Fichier.create(parent: self.first_name, content: Moped::BSON::Binary.new(:generic,binary))
  end
end
