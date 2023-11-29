class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  def verify_otp(otp)
    totp = ROTP::TOTP.new(otp_secret_key)
    totp.verify(otp)
  end
end
