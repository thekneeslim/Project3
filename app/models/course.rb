class Course < ApplicationRecord
  # declare dependent nullify so entry in student's table will not be deleted
  # and instead, the course_id will be set to null instead
  has_many :students, dependent: :nullify
end
