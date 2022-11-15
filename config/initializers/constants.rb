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

  MIN_BOOK_QUANTITY = 1

  MIN_DISCOUNT = 0.1
  MAX_DISCOUNT = 100

  COUPON_DEVIDER = 100
  DEFAULT_DISCOUNT = 0

  MIN_DAYS = 1
  MAX_DAYS = 100

  MIN_PRICE = 0

  DEFAULT_DELIVERY_PRICE = 0

  VALIDATE_CARD_NUMBER = /\A[0-9]{16}\z/
  VALIDATE_NAME_ON_CARD = /\A[a-zA-Z]{1,50}\z/
  VALIDATE_MMVV = %r{\A(0[1-9]|1[0-2])/([0-9]{2})\z}
  VALIDATE_CVV = /\A[0-9]{3,4}\z/

  HIDDEN_NUMBER = '*'

  NUMBER_OF_NEWEST_BOOKS = 3

  NUMBER_OF_BEST_SELLERS = 4

end
