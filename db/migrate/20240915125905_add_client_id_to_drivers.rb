class AddClientIdToDrivers < ActiveRecord::Migration[7.2]
  def change
    add_column :drivers, :client_id, :integer
    add_index :drivers, :client_id
    add_foreign_key :drivers, :clients
  end
end
