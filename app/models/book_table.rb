class BookTable < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :author, presence: true
  validates :category_id, presence: true
  #validates :user_id, presence: true
end
