class DropUsersTasksTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :users_tasks
  end
end