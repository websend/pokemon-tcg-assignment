import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {

  initialize() {
    clearTimeout(this.timeout)

    this.timeout = setTimeout(() => { this.submit }, 200)
  }

  submit() {
    this.element.requestSubmit();
  }
}
