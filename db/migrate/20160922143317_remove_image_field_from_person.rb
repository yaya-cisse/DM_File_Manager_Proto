class RemoveImageFieldFromPerson < ActiveRecord::Migration
  def up
    remove_column :people, :image
  end

  def down
  end
end
