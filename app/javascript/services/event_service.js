import lozad from "lozad"

function reLoadLozad() {
  lozad().observe()
}

export function start() {
  console.info('call Start service')
  reLoadLozad()
  window.addEventListener('reload', function () {
    reLoadLozad()
  })  
}