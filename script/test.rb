def insert
  Person.create( :first_name => "first_name" , :last_name => "last_name", :image => File.binread("#{Rails.root}/public/image.png"), :file => File.binread("#{Rails.root}/public/slack.png"))
end

def retrieve_all
  Person.all
end

def retrieve_a_file
  Person.first.image
end

# File.write("#{Rails.root}/public/result.txt", "userCPU   systemCPU   total    elapsedRealTime")
File.open("#{Rails.root}/public/result.txt", 'w') do |file|
  file.write("  userCPU    systemCPU   total    elapsedRealTime")
  file.write(base = Benchmark.measure { insert })
  file.write(base = Benchmark.measure { retrieve_all })
  file.close
end
