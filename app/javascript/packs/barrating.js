import "jquery-bar-rating";


function initBarrating() {
  $(document).ready(function() {
    $('#check_in_queue_rating').barrating({
      theme: 'bars-1to10'
    });
    $('#check_in_atmosphere_rating').barrating({
      theme: 'bars-1to10'
    });
  })
}

export { initBarrating };
