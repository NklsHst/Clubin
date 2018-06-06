// fetch current browser coordinates
function getLocation() {
  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(fetchClubFromCoordinates);
  } else {
      document.getElementById("checkin-container").innerHTML = "Geolocation is not supported by this browser.";
  }
}


// pass found browser coordinates to rails controller, which finds nearest club and returns json object; also insert browser position in hidden field
function fetchClubFromCoordinates(position) {
  document.getElementById("check_in_latitude").value = position.coords.latitude;
  document.getElementById("check_in_longitude").value = position.coords.longitude;

  fetch(`/geolocated_clubs?lat=${position.coords.latitude}&lng=${position.coords.longitude}`, {
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  }).then(response => response.json()).then((data) => {
        console.log(data.name); // Look at data
        printLocation(data);
      });
}

// display found location on the page for better UI and insert found club location id in hidden field
function printLocation(data) {
  var e = document.getElementById("location")
  var checkin_button = document.getElementById("checkin-button")

  if (data[0] === "Not close to any clubs") {
    checkin_button.classList.remove("loading")
    checkin_button.classList.add("fail")
    checkin_button.innerHTML = `${data}<br><p>You need to be less than 300m away to check in.</p>`;
    checkin_button.insertAdjacentHTML("afterend", `<a href="/checkin" class="btn btn-primary">Try again</a></div>`)

  } else {
    document.getElementById("check_in_location_id").value = data.id
    checkin_button.classList.remove("loading")
    checkin_button.classList.add("active")
    console.log(data.photo.url)
    checkin_button.style.backgroundImage =  `radial-gradient(ellipse at center, rgba(195,56,255,0.1) 0%, rgba(79,79,79,0.6) 100%), url(${data.photo.url})`
    checkin_button.disabled = false
    checkin_button.firstChild.innerHTML = `Tap to check in to <br> <strong>${data.name}</strong> `
  }
}

// submit form including location_id, as well as the browser lat and lng
function submitButton() {
  var btn = document.getElementById("checkin-button");
  var form = document.getElementById("new_check_in");

  if (btn && form) {
    btn.addEventListener("click", function () {
      form.submit();
    });
  }
}

// call all functions
setTimeout(getLocation(), 2000)
submitButton()

// export { getLocation, showPosition }









