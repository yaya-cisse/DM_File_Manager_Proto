class Person < ActiveRecord::Base

  def file
    Fichier.find_by(parent: self.first_name)
  end

  def file=(binary)
    Fichier.create(parent: self.first_name, content: Moped::BSON::Binary.new(:generic,binary))
  end
end
