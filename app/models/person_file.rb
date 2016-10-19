class PersonFile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :file_type, :file
end
