class AddProviderToPeople < ActiveRecord::Migration
  def change
    add_column :people, :file_provider, :string
  end
end
