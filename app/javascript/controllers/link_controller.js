import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  goTo() {
    const url = this.urlValue

    if (this.urlValue != window.location.pathname && !this.ignoreArea) {
      window.location.pathname = url
    }
  }
}
