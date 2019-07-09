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
    //StyleSheets =
    //    'style.css';
    //StartupScript = 'WidgetGeneric.js';
    //RecreateScript = 'WidgetGeneric.js';
    //RefreshScript = 'WidgetGeneric.js';
    //Images = 
    //    'image1.png',
    //    'image2.png';

    //event WidgetLoaded()

    procedure PlayVideo();
    procedure TakePhoto();
    //event PhotoTaked(Video: BigText);
    event PhotoTaken(Video: Text);
}