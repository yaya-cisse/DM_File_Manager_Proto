
# def insert_with_large_files
#   400.times do |i|
#     Person.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}", :file_type => "large", :file => File.binread("#{Rails.root}/public/file.pdf"))
#   end
# end

def insert_with_medium_files
  base = Time.now.to_i
  data  = File.binread("#{Rails.root}/public/image.png")
  (base..base + 1000).each do |i|
    Person.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}", :file_type => "medium", :my_file => data)
  end
end

def insert_with_small_files
  base = Time.now.to_i
  data = File.binread("#{Rails.root}/public/slack.png")
  (base..base + 1000).each do |i|
    Person.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}", :file_type => "small", :my_file => data)
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

def get_all_small_files
  persons = Person.where(file_type: "small")
  persons.each do |person|
    person.my_file
  end
end

def get_all_medium_files
  persons = Person.where(file_type: "medium")
  persons.each do |person|
    person.my_file
  end
end

# def get_records_with_large_files
#   persons = Person.where(file_type: "large")
# end

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

#File.open("#{Rails.root}/public/result.txt", 'w') do |file|

[MongoMan,MysqlMan,CouchbaseMan].each do |name|
  Person.class.send(:include,  name)
  puts "  userCPU    systemCPU   total    elapsedRealTime"
end
  # puts(base = Benchmark.measure { insert_with_large_files }
#   puts base = Benchmark.measure { insert_with_medium_files }
#   puts base = Benchmark.measure { insert_with_small_files }
#   puts base = Benchmark.measure { get_all_records }
#   puts base = Benchmark.measure { get_records_with_small_files }
#   puts base = Benchmark.measure { get_records_with_medium_files }
#   # puts(base = Benchmark.measure { get_records_with_large_files }
#   puts base = Benchmark.measure { get_all_small_files }
#   puts base = Benchmark.measure { get_all_medium_files }
# #  puts(base = Benchmark.measure { destroy_all }
# #  file.close
#end
