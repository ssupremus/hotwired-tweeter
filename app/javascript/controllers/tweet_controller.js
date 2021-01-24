import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    url: String
  }
  static targets = ["ignore", "username", "avatar"]

  goTo() {
    const url = this.urlValue

    if (this.urlValue != window.location.pathname && !this.ignoreArea) {
      window.location.pathname = url
    }
  }

  get ignoreArea() {
    const ignore    = this.ignoreTarget
    const username  = this.usernameTarget
    const avatar    = this.avatarTarget
    let   elem      = event.target

    while (elem.parentNode) {
      if (elem == ignore || elem == username || elem == avatar) {
        return true
      }
      elem = elem.parentNode
    }
    return false
  }
}
