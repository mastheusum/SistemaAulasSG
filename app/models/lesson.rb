class Lesson < ApplicationRecord
  belongs_to :classroom, inverse_of: :lessons
  has_many :student_lessons, inverse_of: :lesson

  accepts_nested_attributes_for :student_lessons
end
