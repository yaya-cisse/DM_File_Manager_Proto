
def insert_with_two_files
  400.times do |i|
    Person.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}", :image => Moped::BSON::Binary.new(:generic,File.binread("#{Rails.root}/public/image.png")), :file => Moped::BSON::Binary.new(:generic,File.binread("#{Rails.root}/public/file.pdf"))
  end
end

def insert_with_large_files
  100.times do |i|
    Person.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}", :file => Moped::BSON::Binary.new(:generic,File.binread("#{Rails.root}/public/file.pdf")))
  end
end

def insert_with_small_files
  4600.times do |i|
    Person.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}", :image => Moped::BSON::Binary.new(:generic,File.binread("#{Rails.root}/public/image.png")))
  end
end

def insert_without_files
  995000.times do |i|
    Person.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}")
  end
end

puts base = Benchmark.measure { insert_with_two_files }
puts base = Benchmark.measure { insert_with_large_files }
puts base = Benchmark.measure { insert_with_small_files }
puts base = Benchmark.measure { insert_with_small_files }
