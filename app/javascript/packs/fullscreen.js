function toggleFullScreen() {
  setTimeout(function() { window.scrollTo(0, 1) }, 100);

  // var doc = window.document;
  // var docEl = doc.documentElement;

  // var requestFullScreen = docEl.requestFullscreen || docEl.mozRequestFullScreen || docEl.webkitRequestFullScreen || docEl.msRequestFullscreen;
  // var cancelFullScreen = doc.exitFullscreen || doc.mozCancelFullScreen || doc.webkitExitFullscreen || doc.msExitFullscreen;

  // if(!doc.fullscreenElement && !doc.mozFullScreenElement && !doc.webkitFullscreenElement && !doc.msFullscreenElement) {
  //   requestFullScreen.call(docEl);
  // }
  // else {
  //   cancelFullScreen.call(doc);
  // }
}

export { toggleFullScreen }
