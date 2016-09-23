class CreateFichiers < ActiveRecord::Migration
  def change
    create_table :fichiers do |t|
      t.binary :content

      t.timestamps
    end
  end
end
