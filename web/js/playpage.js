var audioElement = document.getElementById('my-audio');

audioElement.ontimeupdate = function(){
    changeDuration(audioElement.currentTime); 
};
function changeVolume(val) {
    audioElement.volume = val / 100;
}

function changeDuration(val){
    var rangeElement = document.getElementById('duration-range');
    var total = audioElement.duration;
    var current = (val/total)*100;
    rangeElement.value = current;
}
function checkLoop() {
    if (audioElement.loop) {
        audioElement.loop = false;
    } else {
        audioElement.loop = true;
    }
    $('#repeat-btn').toggleClass('repeat-pressed');
}
