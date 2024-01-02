tableextension 50105 "Purch.Inv.HeaderExt" extends "Purch. Inv. Header"
{
    fields
    {
        field(50100; "CRN No."; Code[20])
        {
            Caption = 'CRN No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50102; "End User"; Text[100])           ///////Nandish 02-24/////////
        {
            Caption = 'End User';
            DataClassification = ToBeClassified;
        }
        field(50103; "End User Code"; Code[20])           ///////Nandish 02-24/////////
        {
            Caption = 'End User Code';
            DataClassification = ToBeClassified;
        }
    }
}
