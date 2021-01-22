import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["liked", "unliked"]
  static values = {
    userIds: Array
  }
  connect() {
    const unliked = this.unlikedTarget
    const liked   = this.likedTarget

    // const userIdsMap = userIds.map(x => x)
    // console.log(userIdsMap)
    // console.log(userIds.includes(userId))

    if (this.entityLiked) {
      liked.classList.remove("hidden")
    } else {
      unliked.classList.remove("hidden")
    }
  }

  get entityLiked() {
    const userId  = this.currentUserId
    let userIds = this.userIdsValue

    for (let index = 0; index < userIds.length; index++) {
      if (userIds[index] == userId) {
        return true
      }
    }
    return false
  }

  get currentUserId() {
    let element = document.querySelector("meta[name='user-id']")

    if (element == null) return

    return element.getAttribute("content")
  }
}
