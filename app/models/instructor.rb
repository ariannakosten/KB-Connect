class Instructor < ApplicationRecord
    has_many :klasses

    def students
        self.klasses.map(&:students).flatten
    end
end
