class AddExchangeIdToBook < ActiveRecord::Migration
  def change
    add_column :book_tables, :exchange_id, :integer
  end
end
