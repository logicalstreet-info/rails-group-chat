import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  connect() {
    const messages = document.getElementById("messages")
    messages.addEventListener("DOMNodeInserted",this.resetScroll);
    this.resetScroll(messages);
  }
  disconnect() {
    
  }
  resetScroll() {
    messages.scrollTop = messages.scrollHeight - messages.clientHeight;
  }
}
