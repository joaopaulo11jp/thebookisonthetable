json.array!(@exchanges) do |exchange|
  json.extract! exchange, :id, :receiver_book_id, :sender_book_id, :status
  json.url exchange_url(exchange, format: :json)
end
