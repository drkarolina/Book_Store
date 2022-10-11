class BooksQuery
  SORT_BY = {
    title_asc: 'title ASC',
    title_desc: 'title DESC',
    newest: 'published_at DESC',
    price_asc: 'price ASC',
    price_desc: 'price DESC'
  }.freeze

  DEFAULT_SORT = 'title_asc'.freeze

  def initialize(books, category_id, sort_by)
    @sort_by = sort_by.nil? ? DEFAULT_SORT : sort_by
    @category_id = category_id
    @books = books
  end

  def filter_and_sort
    @books = filter
    @books.order(SORT_BY[@sort_by.to_sym])
  end

  private

  def filter
    @category_id ? @books.where(category_id: @category_id) : @books
  end
end
