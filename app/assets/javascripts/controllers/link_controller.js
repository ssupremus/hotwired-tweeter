import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    url: String
  }
  static targets = ["ignore"]

  goTo() {
    const url = this.urlValue

    if (this.urlValue != window.location.pathname && !this.ignoreArea) {
      window.location.pathname = url
    }
  }

  get ignoreArea() {
    const ignore  = this.ignoreTarget
    let   elem    = event.target

    while (elem.parentNode) {
      elem = elem.parentNode
      if (elem == ignore) {
        return true
      }
    }
    return false
  }
}
