page 50136 "Camera js test"
{
    PageType = Card;
    UsageCategory = Tasks;
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;
    Editable = true;
    ApplicationArea = All;
    layout
    {
        area(Content)
        {
            group("Image Blob")
            {
                field(Image; BufferCamera.Image)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    Editable = true;
                    CaptionML = ENU = 'Picture';
                }
            }
            group("Camera js")
            {
                usercontrol(Camerajs; "Generic widget")
                {
                    ApplicationArea = All;
                    Visible = true;
                    trigger PhotoTaken(PhotoText: Text)
                    var
                        OutStream: OutStream;
                        Base64Conv: Codeunit "Base64 Convert";
                    begin

                        BufferCamera.Image.CreateOutStream(OutStream);
                        Base64Conv.FromBase64(PhotoText.Remove(1, 22), OutStream);
                        BufferCamera.Modify;
                        BufferCamera.CalcFields(image);
                        CurrPage.update;
                    end;
                    //trigger WidgetLoaded();
                    //begin
                    //    CurrPage.Update(false);
                    //end;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Play)
            {
                ApplicationArea = All;
                Promoted = true;
                CaptionML = ENU = 'Play';
                Image = ViewDescription;
                PromotedIsBig = true;
                trigger OnAction();
                begin
                    CurrPage.Camerajs.PlayVideo();
                    CurrPage.Update(false);
                end;
            }
            action(Photo)
            {
                ApplicationArea = All;
                Promoted = true;
                CaptionML = ENU = 'Photo';
                Image = Picture;
                PromotedIsBig = true;
                trigger OnAction();
                begin
                    CurrPage.Camerajs.TakePhoto();
                    CurrPage.Update(false);
                end;
            }

        }
    }
    var
        TextWidget: Text;
        BufferCamera: Record "Buffer Camera" temporary;

    trigger OnOpenPage();
    begin
        if BufferCamera.Insert() then;
    end;

}
