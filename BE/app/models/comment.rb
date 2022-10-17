class Comment < ApplicationRecord
  BLACKLIST = %w[fuck dkm dcm pusy].freeze

  belongs_to :pr_attribute

  validates :body, presence: true
  validate :validate_cmt

  def validate_cmt
    BLACKLIST.each do |w|
      if body.include?(w)
        errors.add(:body, 'Comment contains obscene content')
        break
      end
    end
  end
end
