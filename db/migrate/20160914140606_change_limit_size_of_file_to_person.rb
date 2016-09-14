class ChangeLimitSizeOfFileToPerson < ActiveRecord::Migration
  def up
    change_column :people, :file, :binary, :limit => 4294967295
  end

  def down
  end
end
