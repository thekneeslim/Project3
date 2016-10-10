class Project < ApplicationRecord
  has_and_belongs_to_many :students
  # belongs_to :students, through: :projects_students
end
