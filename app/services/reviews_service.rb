class ReviewsService
  def initialize(params)
    @params = params
    @review_form = ReviewForm.new(params)
  end

  def call
    @review_form.valid? ? Review.create(@params) : @errors = @review_form.errors

    @errors.blank?
  end

  def errors
    @errors.full_messages.to_sentence
  end
end
