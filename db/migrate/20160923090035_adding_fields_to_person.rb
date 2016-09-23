class AddingFieldsToPerson < ActiveRecord::Migration
  def up
    remove_column :people, :image
    add_column :people, :file_type, :string
    add_column :people, :file_id, :integer
  end

  def down
  end
end
