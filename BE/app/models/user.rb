class User < ApplicationRecord
  has_secure_password
  PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
/x

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 7 },
                       format: { with: PASSWORD_FORMAT }
  # validate :password_validate, if: -> { password.present? }

end
