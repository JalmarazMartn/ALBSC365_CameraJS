controladdin "Generic widget"
{
    RequestedHeight = 2000;
    MinimumHeight = 300;
    MaximumHeight = 3000;
    RequestedWidth = 2000;
    MinimumWidth = 700;
    MaximumWidth = 3000;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 'CameraControl.js';

    procedure PlayVideo();
    procedure TakePhoto();
    //event PhotoTaked(Video: BigText);
    event PhotoTaken(Video: Text);
}