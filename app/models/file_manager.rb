module FileManager
  extend ActiveSupport::Concern

  included do
    # before_save :save_file
    attr_accessible :file_id, :file_type, :set_file
  end

  $provider = nil

  module ClassMethods
    def provider(provider_class)
      $provider = provider_class
    end
    # def provider
    #   @@provider
    # end
  end

  def get_file(id)
    @@provider.get_file(id)
  end

  def set_file=(binary)
    $provider.set_file(binary, self.first_name+"_file.png")
  end


  private

  def save_file
    @@provider.save_file
  end

  # def destroy_file
  #   if self.file_id
  #     file_content = Fichier.find(self.file_id)
  #     file_content.delete
  #   end
  # end

end
