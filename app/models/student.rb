class Student < ApplicationRecord
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :languages
  has_many :works, dependent: :destroy
  belongs_to :event
  belongs_to :course

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}

  validates :password,
  length: { in: 8..72 },
  on: :create

  has_secure_password

  def name
   "#{first_name.titlecase} #{last_name.titlecase}"
  end

  def self.authenticate(params)
    Student.find_by_email(params[:email]).try(:authenticate, params[:password])
  end
end
