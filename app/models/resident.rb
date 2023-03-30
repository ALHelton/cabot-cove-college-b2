class Resident < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :occupation, presence: true

  has_many :resident_courses
  has_many :courses, through: :resident_courses

  def self.avg_age
    require 'pry'; binding.pry
    average(:age).to_f
  end
end
