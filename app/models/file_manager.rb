class FileManager < ActiveRecord::Base
  attr_accessible :file_id, :file_type

  def provider(provider_name)
    self.class.send(:include, provider_name)
  end
end
