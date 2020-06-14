class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_secure_password

  before_create :set_api_key

  def set_api_key
    api_key = SecureRandom.base58(24)
    User.find_by(api_key: api_key) ? set_api_key : self.api_key = api_key
  end
end
