// fetch current browser coordinates
function getLocation() {
  if (navigator.geolocation) {
      // navigator.geolocation.getCurrentPosition(showPosition);
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
  var loader_parent = document.getElementById("loader-parent")
  var loader = document.getElementById("loader")
  var checkin_parent = document.getElementById("checkin-parent")
  var checkin = document.getElementById("checkin")

  if (data[0] === "Not close to any clubs") {
    e.innerHTML = `<div style="text-align: center;"><h2 id="location" style="color: red;">${data}</h2>
    <p>You need to be less than 300m away to check in.</p>`;
    loader_parent.removeChild(loader)
    checkin.remove()
    checkin_parent.insertAdjacentHTML("afterbegin", `<a href="/checkin" class="btn btn-primary">Try again</a></div>`)

  } else {
    e.innerHTML = `<h2 id="location">${data.name}</h2>`
    document.getElementById("check_in_location_id").value = data.id
    loader_parent.removeChild(loader)
  }
}

// submit form including location_id, as well as the browser lat and lng
function submitButton() {
  var btn = document.getElementById("checkin");
  var form = document.getElementById("new_check_in");

  if (btn && form) {
    btn.addEventListener("click", function () {
      form.submit();
    });
  }
}

// call all functions
getLocation()
submitButton()

// export { getLocation, showPosition }
