import { Controller } from "@hotwired/stimulus"
import Splide from "@splidejs/splide"

export default class extends Controller {
  static targets = ['gallery', 'thumbnail']
  primary = undefined
  thumbnail = undefined

  connect() {
  }

  galleryTargetConnected() {
    this.primary = this.initGallery(
      this.galleryTarget.getAttribute('id'),
      Object.assign(this.commonOptions(), this.galleryOptions()),
      true)
    this.sync()
  }

  thumbnailTargetConnected() {
    this.thumbnail = this.initGallery(
      this.thumbnailTarget.getAttribute('id'),
      Object.assign(this.commonOptions(), this.thumbnailOptions()),
      false
    )
    this.sync()
  }

  sync() {
    if (this.primary && this.thumbnail) {
      this.primary.sync(this.thumbnail).mount()
    }
  }

  initGallery(id, options, must_sync) {
    let splide = new Splide(`#${id}`, options)
    if(splide && !must_sync){
      splide.mount()
    }
    return splide
  }

  galleryOptions() {
    return {
    }
  }
  
  thumbnailOptions() {
    return {
      isNavigation: true,
      focus: 'center',
      arrows: true,
      fixedWidth: 100,
      height: 100,
      gap: 1,
      perPage: 1,
    }
  }
  
  commonOptions() {
    return {
      autoplay: false,
      lazyLoad: 'nearby',
      cover: true,
      arrows: false,
      pagination: false,
      type: 'loop'
    }
  }
}