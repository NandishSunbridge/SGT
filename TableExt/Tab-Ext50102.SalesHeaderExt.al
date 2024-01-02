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
        field(50104; "End User"; Text[100])           ///////Nandish 02-24/////////
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
        field(50105; "End User Code"; Code[20])           ///////Nandish 02-24/////////
        {
            Caption = 'End User Code';
            DataClassification = ToBeClassified;
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
            Rec."End User" := OpportunityRec."End User";
            Rec."End User Code" := OpportunityRec."End User Code";
            Rec.Modify(true);
        end;
    end;
}
