module Constants
  SHORT_DESCRIPTION_LENGTH = 250
  BOOKS_LOAD_NUMBER = 8
  SORT_BY = {
    title_asc: I18n.t('constants.title_asc'),
    title_desc: I18n.t('constants.title_desc'),
    newest: I18n.t('constants.newest'),
    price_asc: I18n.t('constants.price_asc'),
    price_desc: I18n.t('constants.price_desc')
  }.freeze
  DEFAULT_SORT = SORT_BY.keys.first
end
