import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["scrollArea", "pagination"]
  connect() {
    this.createObserver()
  }
  createObserver() {
    const observer = new IntersectionObserver(
      entries => this.handleIntersect(entries),
      {
        // https://github.com/w3c/IntersectionObserver/issues/124#issuecomment-476026505
        threshold: [0, 1.0],
      }
    )
    observer.observe(this.scrollAreaTarget)
  }
  handleIntersect(entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        this.loadMore()
        window.dispatchEvent(new Event('reload'))
      }
    })
  }
  loadMore() {
    const next = this.paginationTarget.querySelector("[rel=next]")
    if (!next) {
      return
    }
    const href = next.href
    fetch(href, {
      headers: {
        Accept: "text/vnd.turbo-stream.html",
      },
    })
      .then(r => r.text())
      .then(html => Turbo.renderStreamMessage(html))
  }  
}