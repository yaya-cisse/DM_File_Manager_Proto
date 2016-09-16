
def insert_with_large_and_medium_files
  400.times do |i|
    Person.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}", :image => File.binread("#{Rails.root}/public/image.png"), :file => File.binread("#{Rails.root}/public/file.pdf"))
  end
end

def insert_with_large_and_small_files
  100.times do |i|
    Person.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}", :image => File.binread("#{Rails.root}/public/slack.png"), :file => File.binread("#{Rails.root}/public/file.pdf"))
  end
end

def insert_with_small_and_medium_files
  4500.times do |i|
    Person.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}", :image => File.binread("#{Rails.root}/public/image.png"), :file => File.binread("#{Rails.root}/public/slack.png"))
  end
end

def insert_without_files
  995000.times do |i|
    Person.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}")
  end
end

def get_all_records
  persons = Person.all
end

def get_records_without_files
  persons = Person.where(:image => nil, :file => nil)
end

def get_records_with_images
  persons = Person.where('image != ?', nil)
end

def get_records_with_files
  persons = Person.where('file != ?', nil)
end

puts base = Benchmark.measure { insert_with_large_and_medium_files }
puts base = Benchmark.measure { insert_with_large_and_small_files }
puts base = Benchmark.measure { insert_with_small_and_medium_files }
puts base = Benchmark.measure { insert_without_files }
puts base = Benchmark.measure { get_all_records }
puts base = Benchmark.measure { get_records_without_files }
puts base = Benchmark.measure { get_records_with_images }
puts base = Benchmark.measure { get_records_with_files }
