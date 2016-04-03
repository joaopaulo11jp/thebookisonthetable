class Category < ActiveRecord::Base
  extend FriendlyId
  has_many :book_tables

  friendly_id :description, use: [:slugged, :finders]

  private

  def should_generate_new_friendly_id?
    slug.blank? || description_changed?
  end

end
