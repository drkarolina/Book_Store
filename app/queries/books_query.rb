require_relative '../constants/constants'
class BooksQuery
  def initialize(books, category_id, sort_by)
    @sort_by = sort_by || DEFAULT_SORT
    @category_id = category_id
    @books = books
  end

  def filter_and_sort
    @books = filter
    @books.order(SORT_BY[@sort_by.to_sym])
  end

  private

  def filter
    return @books unless @category_id

    @books.joins(:categories).where('categories.id': @category_id)
  end
end
