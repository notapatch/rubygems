class User < ApplicationRecord
  rolify
  has_many :courses

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  validate :must_have_a_role, on: :update
 
  after_create :assign_default_role

  def username
    email.split(/@/).first
  end

  def to_s
    email
  end

  private

  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "must have at least one role")
    end
  end

  def assign_default_role
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:teacher)
      self.add_role(:student)
    else
      self.add_role(:student) if self.roles.blank?
      self.add_role(:teacher) #if you want any user to be able to create own courses
    end
  end

  ransacker :sign_in_count do
    Arel.sql("to_char(\"#{table_name}\".\"sign_in_count\", '99999')")
  end
end
