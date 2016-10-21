require 'glusterfs'

class GlusterfsManager
  def self.initialize(volume_name, host_name, directory)
    @volume = GlusterFS::Volume.new(volume_name)
    @volume.mount(host_name)
    @dir = GlusterFS::Directory.new(@volume, directory)
    @dir.create
  end

  def self.get_file(file_id)
    file = GlusterFS::File.new(@volume, @dir.path+'/'+file_id)
    @my_file ||= file.read
  end

  def self.set_file(file_id, binary)
    @my_file = binary
    @file = GlusterFS::File.new(@volume, @dir.path+'/'+file_id)
    file_id
  end

  def self.save_file
    size = @file.write(@my_file)
  end

  def self.destroy_file(file_id)
    if file_id
      @volume.delete_file(@dir.path+'/'+file_id)
    end
  end

end
