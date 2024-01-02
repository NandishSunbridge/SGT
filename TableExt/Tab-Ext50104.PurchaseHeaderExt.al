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
        field(50102; "End User"; Text[100])           ///////Nandish 02-24/////////
        {
            Caption = 'End User';
            DataClassification = ToBeClassified;
            trigger OnLookup()
            var
                CustomerRec: Record Customer;
            begin
                CustomerRec.Reset();
                if CustomerRec.FindFirst() then begin
                    if Page.RunModal(Page::"Customer List", CustomerRec) = Action::LookupOK then begin
                        "End User" := CustomerRec.Name;
                        "End User Code" := CustomerRec."No.";
                    end;
                end;
            end;
        }
        field(50103; "End User Code"; Code[20])           ///////Nandish 02-24/////////
        {
            Caption = 'End User Code';
            DataClassification = ToBeClassified;
        }
    }
}
