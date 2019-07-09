//document.write('<html><video id=video width=200 height=150 autoplay></video><br>'+
//'<canvas id=canvas width=200 height=150></canvas></html>');
document.write('<html>Video<br><video id=video width=200 height=150 autoplay></video><br>'+
'Photo<br><canvas id=canvas width=200 height=150></canvas></html>');

function PlayVideo()
{
var video = document.getElementById('video');

if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
    navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
        video.srcObject = stream;
        video.play();
    });
}
}
function TakePhoto()
{
var canvas = document.getElementById('canvas');
var context = canvas.getContext('2d');
var video = document.getElementById('video');

context.drawImage(video, 0, 0, canvas.width, canvas.height);
Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('PhotoTaken', [canvas.toDataURL("image/png")]);
}
//context.toBlob(
//    function(Blob)
//    {
//    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('PhotoTaked', [Blob]);
//    }
//    )

//<video id="video" width="640" height="480" autoplay></video>
//<button id="snap">Snap Photo</button>
//<canvas id="canvas" width="640" height="480"></canvas>
