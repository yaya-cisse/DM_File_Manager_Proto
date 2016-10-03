class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  include FileManager

  # provider LocalStorage

end
