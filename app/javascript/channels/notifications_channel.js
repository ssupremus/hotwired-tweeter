import consumer from "./consumer"

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // var notifications = document.getElementById("notifications")
    var notificationsCount = document.getElementById("notifications_count")
    // var div = document.createElement("div")

    // div.innerHTML = data.html
    // notifications.prepend(div.firstChild)
    notifications_count.innerText = data.count

    if (data.count > 0 && notificationsCount.classList.contains("hidden")) {
      notificationsCount.classList.remove("hidden")
    } else if (data.count == 0 && !notificationsCount.classList.contains("hidden")) {
      notificationsCount.classList.add("hidden")
    }
  }
})
