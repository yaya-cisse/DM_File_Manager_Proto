def insert
  Person.create( :first_name => "first_name" , :last_name => "last_name", :file => Moped::BSON::Binary.new(:generic, File.binread("#{Rails.root}/public/file.pdf") ))
end

# puts base = Benchmark.measure { insert }

# File.write("#{Rails.root}/public/result.txt", "userCPU   systemCPU   total    elapsedRealTime")
File.open("#{Rails.root}/public/result.txt", 'w') do |file|
  file.write("  userCPU    systemCPU   total    elapsedRealTime")
  file.write(base = Benchmark.measure { insert })
  file.write(base = Benchmark.measure { retrieve_all })
  file.close
end
