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
    }
}
