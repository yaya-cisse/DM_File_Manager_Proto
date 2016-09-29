# conn = Couchbase.connect

def insert
  5.times do |i|
    Person.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}", :file_type => "medium", :file => Couchbase::Transcoder::Marshal.dump(File.binread("#{Rails.root}/public/image.png"), 0x1000))#, :file => Couchbase::Transcoder::Marshal.dump(File.binread("#{Rails.root}/public/file.pdf"), 0x1000))
  end
end

# puts base = Benchmark.measure { insert }

def get_files
  persons = Person.where(file_type: "medium")
  persons.each do |person|
    person.file
  end
end

def destroy_all
  Person.destroy_all
end


# File.write("#{Rails.root}/public/result.txt", "userCPU   systemCPU   total    elapsedRealTime")
File.open("#{Rails.root}/public/result.txt", 'w') do |file|
  file.write("  userCPU    systemCPU   total    elapsedRealTime")
  file.write(base = Benchmark.measure { insert })
  file.write(base = Benchmark.measure { get_files })
  file.write(base = Benchmark.measure { destroy_all })
  file.close
end
