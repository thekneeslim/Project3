class Language < ApplicationRecord
  has_and_belongs_to_many :students, dependent: :destroy

end
