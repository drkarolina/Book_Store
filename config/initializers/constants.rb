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
  PASSWORD_FORMAT = /\A(?!.*\s)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/

  ADDRESS_MAX_SIZE = 50
  NAME_MAX_SIZE = 50
  PHONE_MAX_SIZE = 15
  ZIP_MAX_SIZE = 10

  VALIDATE_ADDRESS = /\A[a-zA-z0-9,\-\s]+\z/
  VALIDATE_NAME = /\A[a-zA-z\s]+\z/
  VALIDATE_PHONE = /\A\+[0-9]+\z/
  VALIDATE_ZIP = /\A[0-9-]+\z/

  MIN_RATING = 0
  MAX_RATING = 5

  MAX_REVIEW_TEXT_LENGTH = 500

  VALIDATE_REVIEW = /\A[a-zA-Z0-9\W]+\Z/

  SMALL_SIZE_IMAGE = '200x200'
end
