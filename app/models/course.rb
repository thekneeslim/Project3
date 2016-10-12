class Course < ApplicationRecord
  # declare dependent nullify so entry in student's table will not be deleted
  # and instead, the course_id will be set to null instead
  # this is for one to many relationship
  # in a many to many relationship, dependent: :destroy deletes information in the
  # joint table only
  has_many :students, dependent: :nullify
end
