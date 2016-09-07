def insert
  Person.create( :first_name => "first_name" , :last_name => "last_name", :file => File.binread("#{Rails.root}/public/file.pdf"))
end

puts base = Benchmark.measure { insert }
