pageextension 50120 PurchaseQuoteCardExt extends "Purchase Quote"
{
    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("CRN No."; Rec."CRN No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the CRN No. field.';
                Editable = false;
                trigger OnLookup(var Text: Text): Boolean
                var
                    OpportunityRec: Record Opportunity;
                begin
                    OpportunityRec.Reset();
                    OpportunityRec.SetFilter("CRN No.", '<>%1', '');
                    if OpportunityRec.FindFirst() then begin
                        if Page.RunModal(Page::"Opportunity List", OpportunityRec) = Action::LookupOK then begin
                            Rec."CRN No." := OpportunityRec."CRN No.";
                            Rec."Opportunity No." := OpportunityRec."No.";
                        end;

                    end;
                end;

                trigger OnValidate()
                var
                    OpportunityRec: Record Opportunity;
                begin
                    OpportunityRec.Reset();
                    OpportunityRec.SetRange("CRN No.", Rec."CRN No.");
                    if not OpportunityRec.FindFirst() then begin
                        Error('%1 CRN No. is not found in Opportunity Table.', Rec."CRN No.");
                    end;
                end;
            }
            field("Opportunity No."; Rec."Opportunity No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Opportunity No. field.';
            }
        }
    }
    actions
    {
        addafter("Make Order")
        {
            action("Update Sales Quote Line")
            {
                ApplicationArea = all;
                Caption = 'Update Sales Quote Line';
                Image = Allocate;
                ToolTip = 'Create a saels quote line with the opportunity inserted as the vendor.';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var

                    Ok: Boolean;
                    MangeCRNCU: Codeunit "MangeCRN.";


                begin
                    Ok := false;
                    Ok := Confirm('Are you sure want to create sales quote line', true, false);
                    if not Ok then begin
                        exit;
                    end;
                    MangeCRNCU.SalesQuoteLineCreate(Rec);
                end;
            }
            action("Show Sales Quote")
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Show Sales Quote';
                Image = Quote;
                ToolTip = 'Show the assigned sales quote.';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SalesHeaderRec: Record "Sales Header";
                    OpportunityRec: Record Opportunity;
                begin

                    Rec.TestField("Opportunity No.");
                    Rec.TestField("CRN No.");
                    OpportunityRec.Reset();
                    if not OpportunityRec.Get(Rec."Opportunity No.") then begin
                        Error('Opportunity No. %1 not found', Rec."Opportunity No.");
                    end;
                    OpportunityRec.TestField("Sales Document No.");

                    SalesHeaderRec.Reset();
                    SalesHeaderRec.SetRange("Document Type", SalesHeaderRec."Document Type"::Quote);
                    SalesHeaderRec.SetRange("No.", OpportunityRec."Sales Document No.");
                    if not SalesHeaderRec.FindFirst() then begin
                        Error('Sales Quote No. %1 not found for Opportunity No. %2', OpportunityRec."Sales Document No.", Rec."Opportunity No.");
                    end else begin
                        PAGE.Run(PAGE::"Sales Quote", SalesHeaderRec)
                    end;
                end;
            }
        }
    }
}
