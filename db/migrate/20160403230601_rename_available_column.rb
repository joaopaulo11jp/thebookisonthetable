class RenameAvailableColumn < ActiveRecord::Migration
  def change
    rename_column :book_tables, :available, :removed
  end
end
