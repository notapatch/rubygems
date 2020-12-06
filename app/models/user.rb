class User < ApplicationRecord
  has_many :courses
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def to_s
    email
  end
end
