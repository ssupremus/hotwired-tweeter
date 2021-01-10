import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["window", "cancel"]
  handleModal() {
    const modal = this.windowTarget

    if (modal.classList.contains("hidden")) {
      modal.classList.remove("hidden")
    } else {
      modal.classList.add("hidden")
    }
  }
}
