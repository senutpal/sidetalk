import { createConsumer } from "@rails/actioncable"

const consumer = createConsumer()

document.addEventListener("turbo:load", () => {
  const messagesContainer = document.getElementById("chat-messages")
  if (!messagesContainer) return

  consumer.subscriptions.create("ChatroomChannel", {
    received(data) {
      const messageHtml = `
        <div class="chat-message other">
          <div class="bubble">
            <div class="username">${data.username}</div>
            <div>${data.body}</div>
          </div>
        </div>
      `
      messagesContainer.insertAdjacentHTML("beforeend", messageHtml)
      messagesContainer.scrollTop = messagesContainer.scrollHeight
    }
  })

  messagesContainer.scrollTop = messagesContainer.scrollHeight
})
