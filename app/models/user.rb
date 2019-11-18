class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, length: { minimum: 2 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    users = self.where('LOWER(email) ILIKE ?', email.gsub(/\s+/, ""))

    if users
      user = users[0]
    end

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
