
def insert_with_medium_files
  base = Time.now.to_i
  data  = File.binread("#{Rails.root}/public/image.png")
  (base..base + 1000).each do |i|
    PersonFile.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}", :file_type => "medium", :file => data)
  end
end

def insert_with_small_files
  base = Time.now.to_i
  data = File.binread("#{Rails.root}/public/slack.png")
  (base..base + 1000).each do |i|
    PersonFile.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}", :file_type => "small", :file => data)
  end
end


def get_all_records
  persons = PersonFile.all
end

def get_all_small_files
  persons = PersonFile.where(file_type: "small")
  persons.each do |person|
    person.file
  end
end

def get_all_medium_files
  persons = PersonFile.where(file_type: "medium")
  persons.each do |person|
    person.file
  end
end

def destroy_all
  PersonFile.destroy_all
end


# puts "=====================MySQLEmbedded====================="
# puts "  userCPU    systemCPU   total    elapsedRealTime"
# puts base = Benchmark.measure { insert_with_medium_files }
# puts base = Benchmark.measure { insert_with_small_files }
puts base = Benchmark.measure { get_all_small_files }
puts base = Benchmark.measure { get_all_medium_files }

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
