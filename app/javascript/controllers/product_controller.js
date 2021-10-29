import { Controller } from "@hotwired/stimulus"
import { product_path } from '../routes';

// Connects to data-controller="product"
export default class extends Controller {
  connect() {
  }

  viewDetail(event) {
    const id = event.currentTarget.getAttribute('data-id')
    location.href = Routes.product_path(id)
  }
}