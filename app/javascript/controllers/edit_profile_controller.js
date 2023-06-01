import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-profile"
export default class extends Controller {
  static targets = ["togglableElement"]

  connect() {
    console.log("Hello from edit_profile.js")
  }
  toggle() {
    this.togglableElementTarget.classList.toggle("d-none")
    this.togglableElementTarget.classList.toggle("d-pop-up")
  }
}
