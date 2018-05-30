function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var locationAdress = document.getElementById('location_address');

    if (locationAdress) {
      var autocomplete = new google.maps.places.Autocomplete(locationAdress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(locationAdress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
