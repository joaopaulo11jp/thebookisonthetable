class Exchange < ActiveRecord::Base
  enum status: [:waiting,:confirmed,:rejected]
  belongs_to :receiver_book, :class_name => "BookTable"
  belongs_to :sender_book, :class_name => "BookTable"
end
