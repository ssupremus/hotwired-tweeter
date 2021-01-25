import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["link", "items"]

  showMenu() {
    const items = this.itemsTarget

    if (items.classList.contains("hidden")) {
      this.fetchNotifications
      items.classList.remove("hidden")
      setTimeout(() => {
        document.onclick = () => {
          items.classList.add("hidden")
          document.onclick = null
          this.markAsRead()
        }
      }, 300)
    } else {
      items.innerHTML = ""
      items.classList.add("hidden")
    }
  }

  get fetchNotifications() {
    const items = this.itemsTarget

    fetch("/notifications.json")
      .then(response => response.json())
      .then(notifications => {
        notifications.forEach(notification => {
          let elem = document.createElement("div")

          elem.innerHTML = notification.template
          items.appendChild(elem)
        })
      })
      .catch(error => console.log(error))
  }

  markAsRead() {
    const notificationsCount = document.getElementById("notifications_count")

    notificationsCount.classList.add('hidden')

    Rails.ajax({
      type: "POST",
      url: "/notifications/mark_as_read"
    })
  }
}
