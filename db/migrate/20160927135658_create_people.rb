class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.binary :file
      t.string :file_id
      t.string :file_type


      t.timestamps
    end
  end
end
