def insert
  10.times do
    Person.create( :first_name => "first_name1" , :last_name => "last_name", :file => File.binread("#{Rails.root}/public/slack.png"))
  end
end

def retrieve_all
  Person.all
end

def retrieve_a_file
  Person.first.file
end

def destroy_all
  Person.destroy_all
end

# File.write("#{Rails.root}/public/result.txt", "userCPU   systemCPU   total    elapsedRealTime")
File.open("#{Rails.root}/public/result.txt", 'w') do |file|
  file.write("  userCPU    systemCPU   total    elapsedRealTime")
  file.write(base = Benchmark.measure { insert })
  file.write(base = Benchmark.measure { retrieve_a_file })
  file.write(base = Benchmark.measure { destroy_all })
  file.close
end
