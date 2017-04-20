chrome.runtime.onMessage.addListener(
  function(request, sender, sendResponse) {
    if ( request.action == "startLightbox" ) {
      background = document.createElement('div');
      background.id = "lightbox_background";
      lightbox = document.createElement('div');
      lightbox.id = "lightbox_extension";
      document.body.appendChild(background);
      background.appendChild( lightbox );
      var xhr = new XMLHttpRequest();
      closeScriptureLightbox = function() {
        var lb = document.getElementById('lightbox_background');
        lb.parentNode.removeChild( lb );
      }
      getURLInfo = function(callback) {
        // TODO: in a HTTPS site, switch to the secure protocol
        xhr.open("GET", "http://localhost:3000/score_word/"+request.word, true);
        xhr.onreadystatechange = function() {
          if (xhr.readyState == 4) {
            // defensive check
            if (typeof callback == "function") {
              callback.apply(xhr);
            }
          }
        }
        // send the request *after* the event handler is defined
        xhr.send();
      }

      var jhash = '';
      // Set close button
      button = document.createElement('button');
      button.onclick=closeScriptureLightbox;
      button.textContent='Close';
      getURLInfo(function() {
        jhash = JSON.parse(xhr.responseText);
        lightbox.innerHTML = '<h1>Word: '+ request.word +'<br />Valid: ' + jhash['valid'] + '<br />Score: ' + jhash['score'] + '</h1>';
        lightbox.appendChild(button);
      });

      sendResponse({farewell: "goodbye"});
      setTimeout(closeScriptureLightbox, 5000);
  }
});
