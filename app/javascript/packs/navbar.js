function clean() {
  document.getElementById("locations").classList.remove("active-bottom")
  document.getElementById("friendscheckins").classList.remove("active-bottom")
  document.getElementById("checkins").classList.remove("active-bottom")
  document.getElementById("conversations").classList.remove("active-bottom")
  document.getElementById("users").classList.remove("active-bottom")
}


function toggleClass(id) {
  clean()
  document.getElementById(id).classList.add("active-bottom")
}


function navbar() {
  var url = window.location.href

  if (url.includes("locations")) {
    toggleClass("locations")
  }

  if (url.match(/(.*?)checkins/)) {
    toggleClass("friendscheckins")
  }

  if (url.match(/(.*?)checkin\b/)) {
    toggleClass("checkins")
  }

  if (url.includes("conversations")) {
    toggleClass("conversations")
  }

  if (url.includes("users")) {
    toggleClass("users")
  }
}

navbar()
