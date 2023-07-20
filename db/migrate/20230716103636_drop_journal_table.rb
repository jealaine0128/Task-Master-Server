class DropJournalTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :journals
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
