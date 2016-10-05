module FileManager
  extend ActiveSupport::Concern

  included do
    before_save :save_file
    attr_accessible :file_id, :file_name, :set_file
    after_destroy :destroy_file
  end

  @@provider = nil

  module ClassMethods
    def provide(provider)
      @@provider = provider
    end
    def provider
      @@provider
    end
  end

  def get_file
    Person.provider.get_file(self.file_id)
  end

  def set_file=(binary)
    self.file_id = Person.provider.set_file(binary, self.file_id)
  end


  private

  def save_file
    Person.provider.save_file
  end

  def destroy_file
    Person.provider.destroy_file(self.file_id)
  end

end
