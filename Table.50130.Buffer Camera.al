table 50130 "Buffer Camera"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Unique Key"; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Image; Blob)
        {
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
    }

    keys
    {
        key(PK; "Unique Key")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}