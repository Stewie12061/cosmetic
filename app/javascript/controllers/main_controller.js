import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['main']
  static lozadLoaded = false

  connect() {
  }

  mainTargetConnected() {
    if (!this.lozadLoaded) {
      this.loadDefault()
    }
  }

  mainTargetDisconnected() {
    this.lozadLoaded = false
  }

  loadDefault() {
    window.dispatchEvent(new Event('reload'))
  }

  disconnect() {
  }

  initialize() {
  }
}