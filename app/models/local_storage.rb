class LocalStorage < BaseProvider

  def self.get_file(name)
    @my_file ||= File.binread(name)
  end

  def self.set_file(binary, name)
    @my_file = binary
    File.open(name,"wb"){|file| file.write(@my_file)}
    # @name = name
  end

  def self.save_file
    File.open(@name,"wb"){|file| file.write(@my_file)}
  end
end
