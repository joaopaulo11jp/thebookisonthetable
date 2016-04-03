class RevertRenameColumns < ActiveRecord::Migration
  def change
    rename_column :exchanges, :receiver_book, :receiver_book_id
    rename_column :exchanges, :sender_book, :sender_book_id
  end

end
