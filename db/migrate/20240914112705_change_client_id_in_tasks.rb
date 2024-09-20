class ChangeClientIdInTasks < ActiveRecord::Migration[7.2]
  def change
    change_column :tasks, :client_id, :integer, null: true
  end
end
