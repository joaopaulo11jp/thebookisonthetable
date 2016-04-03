json.array!(@book_tables) do |book_table|
  json.extract! book_table, :id, :title, :author, :category_id, :user_id
  json.url book_table_url(book_table, format: :json)
end
