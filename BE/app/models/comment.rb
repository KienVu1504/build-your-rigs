class Comment < ApplicationRecord
  # BLACKLIST = %w[fuck dkm dcm pussy].freeze

  belongs_to :pr_attribute

  validates :body, presence: true
  validate :validate_cmt

  def validate_cmt
    BlackList.each do |w|
      if body.include?(w)
        errors.add(:body, 'Comment contains obscene content')
        break
      end
    end
  end
end
