require 'glusterfs'

class GlusterfsManager < BaseProvider
  def self.initialize(volume_name, host_name, directory)
    @volume = GlusterFS::Volume.new(volume_name)
    @volume.mount(host_name)
    @dir = GlusterFS::Directory.new(@volume, directory)
    @dir.create
  end

  def self.get_file(file_id)
    file = GlusterFS::File.new(@volume, file_id)
    file.read
  end

  def self.set_file(file_id, binary)
    file_id = @dir.path+'/'+file_id
    @file = GlusterFS::File.new(@volume, file_id)
    @file.write(binary)
    file_id
  end

  def self.destroy_file(file_id)
    if file_id
      @volume.delete_file(file_id)
    end
  end

end
