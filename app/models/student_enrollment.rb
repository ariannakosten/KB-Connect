class StudentEnrollment < ApplicationRecord
    belongs_to :student
    belongs_to :klass
end
