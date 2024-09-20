class AddUsernameToDrivers < ActiveRecord::Migration[7.2]
  def change
    add_column :drivers, :username, :string
    add_index :drivers, :username, unique: true
  end
end
