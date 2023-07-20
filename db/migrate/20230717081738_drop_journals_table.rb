class DropJournalsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :journals
  end
end