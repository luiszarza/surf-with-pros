import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "date" ]

  connect() {

    flatpickr(this.dateTarget, {})
    this.dateTarget.insertAdjacentHTML('afterend', '<i class="booking-cal fa-solid fa-calendar-days"></i>');
  }
}
