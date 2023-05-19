class Classroom < ApplicationRecord
    has_many :students, inverse_of: :classroom
    has_many :lessons, inverse_of: :classroom
end
