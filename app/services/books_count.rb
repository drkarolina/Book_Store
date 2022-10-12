module BooksCount
  def self.current_books_count(params)
    return Constants::BOOKS_LOAD_NUMBER unless params[:current_books_count]

    params[:current_books_count].to_i + Constants::BOOKS_LOAD_NUMBER
  end
end
