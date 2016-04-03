class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.integer :receiver_book_id
      t.integer :sender_book_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
