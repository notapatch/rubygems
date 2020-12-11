class Lesson < ApplicationRecord
  extend FriendlyId
  belongs_to :course

  friendly_id :title, use: :slugged
end
