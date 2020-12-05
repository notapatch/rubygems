class Course < ApplicationRecord
  extend FriendlyId
  belongs_to :user
  has_rich_text :description
  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5}
end
