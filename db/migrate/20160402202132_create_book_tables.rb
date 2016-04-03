class CreateBookTables < ActiveRecord::Migration
  def change
    create_table :book_tables do |t|
      t.string :title
      t.string :author
      t.integer :category_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
