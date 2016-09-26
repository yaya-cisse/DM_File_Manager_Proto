
def insert_with_large_files
  400.times do |i|
    Person.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}", :file_type => "large", :file => File.binread("#{Rails.root}/public/file.pdf"))
  end
end

def insert_with_medium_files
  100.times do |i|
    Person.create( :first_name => "first_name_#{i+400}" , :last_name => "last_name_#{i+400}", :file_type => "medium", :file => File.binread("#{Rails.root}/public/image.png"))
  end
end

def insert_with_small_files
  4500.times do |i|
    Person.create( :first_name => "first_name_#{i+500}" , :last_name => "last_name_#{i+500}", :file_type => "small", :file => File.binread("#{Rails.root}/public/slack.png"))
  end
end

# def insert_without_files
#   995000.times do |i|
#     Person.create( :first_name => "first_name_#{i+4500}" , :last_name => "last_name_#{i+4500}")
#   end
# end

def get_all_records
  persons = Person.all
end

# def get_records_without_files
#   persons = Person.where(:file => nil)
# end

def get_records_with_small_files
  persons = Person.where(file_type: "small")
end

def get_records_with_medium_files
  persons = Person.where(file_type: "medium")
end

def get_records_with_large_files
  persons = Person.where(file_type: "large")
end

def destroy_all
  Person.destroy_all
end

# puts base = Benchmark.measure { insert_with_large_and_medium_files }
# puts base = Benchmark.measure { insert_with_large_and_small_files }
# puts base = Benchmark.measure { insert_with_small_and_medium_files }
# puts base = Benchmark.measure { insert_without_files }
# puts base = Benchmark.measure { get_all_records }
# puts base = Benchmark.measure { get_records_without_files }
# puts base = Benchmark.measure { get_records_with_images }
# puts base = Benchmark.measure { get_records_with_files }
# puts base = Benchmark.measure { destroy_all }

File.open("#{Rails.root}/public/result.txt", 'w') do |file|
  file.write("  userCPU    systemCPU   total    elapsedRealTime")
  file.write(base = Benchmark.measure { insert_with_large_files })
  file.write(base = Benchmark.measure { insert_with_medium_files })
  file.write(base = Benchmark.measure { insert_with_small_files })
  file.write(base = Benchmark.measure { get_all_records })
  file.write(base = Benchmark.measure { get_records_with_small_files })
  file.write(base = Benchmark.measure { get_records_with_medium_files })
  file.write(base = Benchmark.measure { get_records_with_large_files })
  file.write(base = Benchmark.measure { destroy_all })
  file.close
end
