# conn = Couchbase.connect

def insert
  Person.create( :first_name => "first_name" , :last_name => "last_name", :image => Couchbase::Transcoder::Marshal.dump(File.binread("#{Rails.root}/public/image.png"), 0x1000))#, :file => Couchbase::Transcoder::Marshal.dump(File.binread("#{Rails.root}/public/file.pdf"), 0x1000))
end

puts base = Benchmark.measure { insert }
