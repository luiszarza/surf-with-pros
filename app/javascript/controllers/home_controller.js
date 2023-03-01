import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="home"
export default class extends Controller {
  connect() {
    console.log("hello from home page")
  }

  disconnect() {
    console.log("bye bye from home page")
  }
}
