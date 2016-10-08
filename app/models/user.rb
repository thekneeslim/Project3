class User < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :admins, dependent: :destroy

end
