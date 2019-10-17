class Klass < ApplicationRecord
    belongs_to :instructor
    has_many :student_enrollments
    has_many :students, through: :student_enrollments
end
