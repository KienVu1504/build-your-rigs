class Comment < ApplicationRecord
  # BLACKLIST = %w[fuck dkm dcm pussy].freeze
  # belongs_to :pr_attribute
  has_one :report

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

  validates :body, presence: true, length: { maximum: 500,
                                             too_long: '%<count>s characters is the maximum allowed' }
  validate :validate_cmt, if: -> { body.present? }

  def validate_cmt
    BlackList.all.each do |w|
      if body.include?(w.word)   # .word => object
        errors.add(:body, 'Comment contains obscene content')
        break
      end
    end
  end
end
