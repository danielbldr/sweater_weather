class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :api_key, presence: true

  has_secure_password

  before_create :set_api_key

  def set_api_key
    self.api_key = SecureRandom.base58(24)
  end
end
