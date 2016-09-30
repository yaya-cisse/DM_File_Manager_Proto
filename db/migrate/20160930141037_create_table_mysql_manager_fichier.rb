class CreateTableMysqlManagerFichier < ActiveRecord::Migration
  def change
    create_table :mysql_manager_fichiers do |t|
      t.binary :content, :limit => 2.gigabytes

      t.timestamps
    end
  end
end
