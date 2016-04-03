class RemoveExchangeIdColumAndPutAvailableColumn < ActiveRecord::Migration
  def change
    remove_column :book_tables, :exchange_id
    add_column :book_tables, :available, :boolean
  end
end
