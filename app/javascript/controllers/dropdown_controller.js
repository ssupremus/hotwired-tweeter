import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["link", "items"]

  showMenu() {
    const items = this.itemsTarget

    if (items.classList.contains("hidden")) {
      items.classList.remove("hidden")
      setTimeout(() => {
        document.onclick = () => {
          items.classList.add("hidden")
          document.onclick = null
        }
      }, 300)
    } else {
      items.classList.add("hidden")
    }
  }
}
