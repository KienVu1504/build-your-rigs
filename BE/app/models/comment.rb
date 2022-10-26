class Comment < ApplicationRecord
  # BLACKLIST = %w[fuck dkm dcm pussy].freeze
  # belongs_to :pr_attribute
  has_one :report
  # after_create :increment_count
  # after_destroy :decrement_count

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

  validates :body, presence: true, length: { maximum: 500,
                                             too_long: '%<count>s characters is the maximum allowed' }
  validate :validate_cmt, if: -> { body.present? }
  validates :name, presence: true
  # validates :status, in: [true, false]#, on: :update
  # validates_inclusion_of :status, in: [true, false]
  validate :validate_status, on: :update

  def validate_cmt
    # binding.pry
    BlackList.all.each do |w|
      if body.include?(w.word) # .word => object
        errors.add(:body, 'Comment contains obscene content')
        break
      end
    end
  end

  def validate_status
    return errors.add(:status, 'not blank') if status.nil?
  end

  # Dem comment to comment (+)
  #   def increment_count
  #     parent = commentable
  #     parent = parent.commentable while parent.is_a? Comment
  #     # commentable.increment! :comment_count
  #     parent.increment! :comment_count
  #   end
  #   # Dem comment to comment (-)

  #   def decrement_count
  #     commentable.decrement! :comment_count
  #   end
end
