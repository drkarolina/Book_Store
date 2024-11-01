import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

require('jquery')
require('packs/books/readMore')
require('packs/books/viewMore')
require('packs/books/cart')
require('packs/books/reviewStars')
require('packs/checkout/useBillingAddress.js')
require('packs/settings/remove_account')
import "bootstrap"
import '@fortawesome/fontawesome-free/css/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
