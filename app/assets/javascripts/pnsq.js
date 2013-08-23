// Tutoriales sacados de
// http://www.html5rocks.com/en/tutorials/getusermedia/intro/
// http://chimera.labs.oreilly.com/books/1234000001552/ch01.html#s01_2
// http://mozilla.github.io/

// Comprueba si el navegador soporta GetUserMedia()
function hasGetUserMedia() {
  return !!(navigator.getUserMedia || navigator.webkitGetUserMedia ||
            navigator.mozGetUserMedia || navigator.msGetUserMedia);
  }

if (hasGetUserMedia()) {

} else {
    alert('getUserMedia() is not supported in your browser');
}

// ------------------------- Generales -------------------------
// START
function start_record_audio() {
  if (!!navigator.mozGetUserMedia) {
    start_record_audio_moz();
  } else if (!!navigator.mozGetUserMedia) {
    record_audio_webkit();
  }
}

// STOP
function stop_record_audio() {
  if (!!navigator.mozGetUserMedia) {
    stop_record_audio_moz();
  } else if (!!navigator.mozGetUserMedia) {
    record_audio_webkit();
  }
}


 var onFailSoHard = function(e) {
    console.log('Reeeejected!', e);
  }; 


// ------------------------- FIREFOX -------------------------

  var pnsq = document.createElement("audio");
  pnsq.setAttribute("controls", true);

// Funcion para guardar audio (MOZ - START)
function start_record_audio_moz() {
  try {
    window.navigator.mozGetUserMedia({audio: true}, function(stream) {
      // content.appendChild(audio);
      pnsq.mozSrcObject = stream;
      pnsq.play();

    }, function(err) {
      message.innerHTML = "<p class='error'>" + err + "</p>";
      stopMedia();
    });
  } catch(e) {
    message.innerHTML = "<p class='error'>" + e + "</p>";
    stopMedia();
  }
}

function pause_record_audio_moz() {
  try {
    window.navigator.mozGetUserMedia({audio: true}, function(stream) {
      message.innerHTML = "<p>Success!</p>";
      content.appendChild(pnsq);
      pnsq.mozSrcObject = stream;
      pnsq.play();

    }, function(err) {
      message.innerHTML = "<p class='error'>" + err + "</p>";
      stop_record_audio_moz();
    });
  } catch(e) {
    message.innerHTML = "<p class='error'>" + e + "</p>";
    stop_record_audio_moz();
  }
}

// MOZ - PAUSE
function stop_record_audio_moz() {
  pnsq.mozSrcObject.stop();
  pnsq.mozSrcObject = null;
  // content.removeChild(audio);
  audio_status = false;
  
  saved_stream = null;

}

// ------------------------- WEBKIT -------------------------
  // Funcion para guardar audio (WEBKIT - START)
  function record_audio_webkit() {
    var context = new window.webkitAudioContext();
    navigator.webkitGetUserMedia({audio: true}, function(stream) {
      var microphone = context.createMediaStreamSource(stream);
      var filter = context.createBiquadFilter();

      // microphone -> filter -> destination.
      microphone.connect(filter);
      filter.connect(context.destination);
    }, onFailSoHard);
  }
