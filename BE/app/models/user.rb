class User < ApplicationRecord
  has_secure_password


  validates :email, presence: true, uniqueness: true
  validates :password, presence: true


  validate :validate_password_format, if: -> { password.present? }

  def validate_password_format
    special = "?<>',?[]}{=-)(*&^%$#`~{}!"
    regex = /[#{special.gsub(/./) { |char| "\\#{char}" }}]/
    return errors.add(:password, 'must contain at least 1 uppercase') unless password.match(/\p{Upper}/)
    return errors.add(:password, 'must contain at least 1 lowercase ') unless password.match(/\p{Lower}/)
    return errors.add(:password, 'must contain special character') unless password =~ regex
    return errors.add(:password, 'must contain at least one number') unless password.count('0-9') > 0
  end


end
