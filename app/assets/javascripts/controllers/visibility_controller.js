import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    userId: Number
  }

  connect() {
    if (this.currentUserId == this.userIdValue) {
      this.element.classList.remove("hidden")
    }
  }

  get currentUserId() {
    let element = document.querySelector("meta[name='user-id']")

    if (element == null) return

    return element.getAttribute("content")
  }
}
