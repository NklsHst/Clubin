function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showPosition(position) {
    console.log(position.coords)
    console.log(position.coords.latitude)
    console.log(position.coords.longitude)
    document.getElementById("check_in_latitude").value = position.coords.latitude;
    document.getElementById("check_in_longitude").value = position.coords.longitude;
    document.getElementById("new_check_in").submit()
}

export { getLocation, showPosition }
