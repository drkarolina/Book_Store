class BooksFilter
  def initialize(params)
    @params = params
  end

  def call
    @books = Book.all.decorate
    @sort_by = @params[:sort_by] || Constants::DEFAULT_SORT
    @category_id = @params[:category_id]
    filter_and_sort
  end

  private

  def filter_and_sort
    @books = filter
    @books.order(Constants::SORT_BY[@sort_by.to_sym])
  end

  def filter
    return @books unless @category_id

    @books.joins(:categories).where('categories.id': @category_id)
  end
end
