class LocalStorage < BaseProvider

  def self.get_file(file_id)
    @my_file ||= File.binread(file_id)
  end

  def self.set_file(file_id, binary)
    @my_file = binary
    @file_name = file_id

    file_id
  end

  def self.save_file
    File.open(@file_name,"wb"){|file| file.write(@my_file)}
  end

  def self.destroy_file(file_id)
    if file_id
      File.delete(file_id)
    end
  end

end
