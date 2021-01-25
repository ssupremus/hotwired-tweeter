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

          elem.className = "block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
          if (notification.notifiable["type"] == "tweet") {
            if (notification.action == "mentioned") {
              elem.innerHTML = `@${notification.user} ${notification.action} you in a tweet`
            } else if (notification.action == "liked") {
              elem.innerHTML = `@${notification.user} ${notification.action} your tweet`
            } else if (notification.action == "commented") {
              elem.innerHTML = `@${notification.user} ${notification.action} commented your tweet`
            }
          } else if (notification.notifiable["type"] == "comment") {
            if (notification.action == "mentioned") {
              elem.innerHTML = `@${notification.user} ${notification.action} you in a comment`
            } else if (notification.action == "liked") {
              elem.innerHTML = `@${notification.user} ${notification.action} your comment`
            }
          } else {
            elem.innerHTML = `@${notification.user} ${notification.action} you!`
          }
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
