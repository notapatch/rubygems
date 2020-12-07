class User < ApplicationRecord
  has_many :courses

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  def username
    email.split(/@/).first
  end

  def to_s
    email
  end

  private

  ransacker :sign_in_count do
    Arel.sql("to_char(\"#{table_name}\".\"sign_in_count\", '99999')")
  end
end
