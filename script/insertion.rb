CONN = ActiveRecord::Base.connection
TIMES = 1000000

def insert
  TIMES.times do |i|
    Person.create( :first_name => "first_name_#{i}" , :last_name => "last_name_#{i}", :image => File.binread "#{Rails.root}/public/image.png", :file => "#{Rails.root}/public/file.png")
  end
end

puts base = Benchmark.measure { insert }
