module Constants
  SHORT_DESCRIPTION_LENGTH = 250
  BOOKS_LOAD_NUMBER = 8
  SORT_BY = {
    title_asc: 'title ASC',
    title_desc: 'title DESC',
    newest: 'published_at DESC',
    price_asc: 'price ASC',
    price_desc: 'price DESC'
  }.freeze
  DEFAULT_SORT = SORT_BY.keys.first
end
