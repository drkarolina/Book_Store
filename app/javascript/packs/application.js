import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

require('jquery')
import "bootstrap"
import '@fortawesome/fontawesome-free/css/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
