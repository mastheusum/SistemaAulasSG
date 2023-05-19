class Student < ApplicationRecord
  belongs_to :classroom, inverse_of: :students
  has_many :student_lessons, inverse_of: :student
end
