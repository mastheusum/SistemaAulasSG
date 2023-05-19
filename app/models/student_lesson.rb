class StudentLesson < ApplicationRecord
  belongs_to :lesson, inverse_of: :student_lessons
  belongs_to :student, inverse_of: :student_lessons
end
