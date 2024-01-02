tableextension 50104 PurchaseHeaderExt extends "Purchase Header"
{
    fields
    {
        field(50100; "CRN No."; Code[20])
        {
            Caption = 'CRN No.';
            DataClassification = ToBeClassified;
            ///Editable = false;
        }
        field(50101; "Opportunity No."; Code[20])
        {
            Caption = 'Opportunity No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
