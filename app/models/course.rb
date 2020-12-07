class Course < ApplicationRecord
  extend FriendlyId

  LANGUAGES = [:"English", :"Russian", :"Polish", :"Spanish"]
  LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]

  belongs_to :user
  has_rich_text :description
  friendly_id :title, use: :slugged

  validates :title, :short_description, :language, :level, :price, presence: true
  validates :description, presence: true, length: { minimum: 5}

  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  def self.levels
    LEVELS.map { |level| [level, level] }
  end
end
