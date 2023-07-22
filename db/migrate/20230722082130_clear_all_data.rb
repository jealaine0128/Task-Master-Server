# db/migrate/20230722125315_clear_all_data.rb
class ClearAllData < ActiveRecord::Migration[7.0]
  def up
    # Clear data from the "categories" table
    Category.destroy_all

    # Clear data from the "tasks" table
    Task.destroy_all

    # Clear data from the "users" table
    User.destroy_all
  end

  def down
    # If you need to rollback the migration, you can add code here to restore data
    # However, be cautious about using this as it will delete all your data again
  end
end