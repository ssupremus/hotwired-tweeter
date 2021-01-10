import { Controller } from "stimulus"

export default class extends Controller {
  goTo() {
    const url = this.element.href

    window.location = url
  }
}
