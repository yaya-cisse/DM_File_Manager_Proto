class ChangeFileSizeLimitToPerson < ActiveRecord::Migration
  def up
    change_column :fichiers, :content, :binary, :limit => 4.gigabytes-1
  end

  def down
  end
end
