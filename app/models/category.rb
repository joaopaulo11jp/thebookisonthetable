class Category < ActiveRecord::Base
  has_many :book_tables
end
