class CreatePersonFiles < ActiveRecord::Migration
  def change
    create_table :person_files do |t|
      t.string :first_name
      t.string :last_name
      t.binary :file, :limit => 2.gigabytes
      t.string :file_type

      t.timestamps
    end
  end
end
