class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, length: { minimum: 2 }
  validates :password_confirmation, presence: true

end
