class RenameReceiverAndSenderBookColumnsInExchange < ActiveRecord::Migration
  def change
    rename_column :exchanges, :receiver_book_id, :receiver_book
    rename_column :exchanges, :sender_book_id, :sender_book
  end
end
