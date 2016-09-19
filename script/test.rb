# conn = Couchbase.connect

def insert
  Person.create( :first_name => "first_name" , :last_name => "last_name", :image => Couchbase::Transcoder::Marshal.dump(File.binread("#{Rails.root}/public/image.png"), 0x1000))#, :file => Couchbase::Transcoder::Marshal.dump(File.binread("#{Rails.root}/public/file.pdf"), 0x1000))
end

# puts base = Benchmark.measure { insert }

# File.write("#{Rails.root}/public/result.txt", "userCPU   systemCPU   total    elapsedRealTime")
File.open("#{Rails.root}/public/result.txt", 'w') do |file|
  file.write("  userCPU    systemCPU   total    elapsedRealTime")
  file.write(base = Benchmark.measure { insert })
  file.write(base = Benchmark.measure { retrieve_all })
  file.close
end
