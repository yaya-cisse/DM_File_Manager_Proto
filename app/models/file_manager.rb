module FileManager
  extend ActiveSupport::Concern
  FileManager.extend AfterDo

  # FileManager.after :set_file do save_file end

  included do
    # FileManager.after :set_file= do :save_file end
    attr_accessible :file_id, :file_type, :file_provider, :set_file
    after_destroy :destroy_file
  end


  module ClassMethods
    def provide(provider)
      @@provider = provider
    end
    def provider
      @@provider
    end
  end

  def get_file
    file_provider.constantize.get_file(self.file_id)
  end

  def set_file=(binary)
    self.file_provider = Person.provider.to_s
    self.file_id = file_provider.constantize.set_file(self.file_id, binary)
  end


  private
  def save_file
    file_provider.constantize.save_file
  end

  def destroy_file
    file_provider.constantize.destroy_file(self.file_id)
  end
end
