tableextension 50102 SalesHeaderExt extends "Sales Header"
{
    fields
    {
        field(50100; "CRN No."; Code[20])
        {
            Caption = 'CRN No.';
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(50101; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50102; "Vendor Name"; Text[50])
        {
            Caption = 'Vendor Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50103; "Purchase Quote No."; Code[20])
        {
            Caption = 'Purchase Quote No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }

    }
    trigger OnAfterInsert()
    var
        OpportunityRec: Record Opportunity;
    begin
        OpportunityRec.Reset();
        OpportunityRec.SetRange("No.", Rec."Opportunity No.");
        if OpportunityRec.FindFirst() then begin
            Rec."CRN No." := OpportunityRec."CRN No.";
            Rec.Modify(true);
        end;
    end;
}
