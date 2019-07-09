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
            group(Images)
            {
                field("Image"; BufferImage.Picture)
                {
                    ApplicationArea = All;
                    Editable = true;
                    MultiLine = true;
                }
            }
            group("Camera js")
            {
                //field("Widget to show"; TextWidget)
                //{
                //    ApplicationArea = All;
                //    Editable = true;
                //    MultiLine = true;
                //}
                usercontrol(Camerajs; "Generic widget")
                {
                    ApplicationArea = All;
                    Visible = true;
                    trigger PhotoTaken(PhotoText: Text)
                    var
                        OutStream: OutStream;
                        InsTream: InStream;
                        TempBlob: Record TempBlob temporary;
                    begin
                        message(PhotoText);
                        TempBlob.FromBase64String(PhotoText.Remove(1, 22));
                        TempBlob.Insert;
                        TempBlob.Blob.CreateInStream(InsTream);
                        if BufferImage.Insert() then;
                        BufferImage.Picture.CreateOutStream(OutStream);
                        CopyStream(OutStream, InsTream);
                        BufferImage.modify;
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
        BufferImage: Record Contact temporary;

    trigger OnOpenPage();
    begin
        TextWidget := '<div id="c_a4a67a5b5f19ff28866ed39aff57f43e" class="mini"></div>' +
'<script type="text/javascript" src="https://www.eltiempo.es/widget/widget_loader/a4a67a5b5f19ff28866ed39aff57f43e"></script>';
    end;

}
