class ReviewForm
  include ActiveModel::Model
  attr_accessor :title, :text, :rating, :status, :book_id, :user_id

  validates :title, :text, :rating, :book_id, :user_id, presence: true
  validates :rating, numericality: { greater_than: Constants::MIN_RATING,
                                     less_than_or_equal_to: Constants::MAX_RATING }
  validates :text, length: { maximum: Constants::MAX_REVIEW_TEXT_LENGTH },
                   format: { with: Constants::VALIDATE_REVIEW,
                             message: I18n.t('books.partials.review_form.invalid_text') }
  validates :title, length: { maximum: Constants::MAX_REVIEW_TEXT_LENGTH },
                    format: { with: Constants::VALIDATE_REVIEW,
                              message: I18n.t('books.partials.review_form.invalid_title') }

  def initialize(params = {})
    super(params)
  end
end
