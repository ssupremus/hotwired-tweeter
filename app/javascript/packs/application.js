import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../css/application"
Rails.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")

import "controllers"
