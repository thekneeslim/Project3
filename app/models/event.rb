class Event < ApplicationRecord
  has_many :students, dependent: :nullify

end
