import { Controller } from "@hotwired/stimulus"
import lozad from "lozad"

export default class extends Controller {
  connect() {
    lozad().observe()
  }
}
