def insert
  Person.create( :first_name => "first_name1" , :last_name => "last_name", :image => File.binread("#{Rails.root}/public/image.png"), :file => File.binread("#{Rails.root}/public/slack.png"))
end

puts base = Benchmark.measure { insert }
