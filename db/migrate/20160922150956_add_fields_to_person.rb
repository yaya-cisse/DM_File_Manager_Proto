class AddFieldsToPerson < ActiveRecord::Migration
  def change
    add_column :people, :file_id, :string
    add_column :people, :file_type, :string
  end
end
