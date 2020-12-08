class Course < ApplicationRecord
  extend FriendlyId
  include PublicActivity::Model

  LANGUAGES = [:"English", :"Russian", :"Polish", :"Spanish"]
  LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]

  belongs_to :user
  has_rich_text :description
  friendly_id :title, use: :slugged
  tracked owner: Proc.new{ |controller, model| controller&.current_user }

  validates :title, :short_description, :language, :level, :price, presence: true
  validates :description, presence: true, length: { minimum: 5}

  def to_s
    title
  end

  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  def self.levels
    LEVELS.map { |level| [level, level] }
  end
end
