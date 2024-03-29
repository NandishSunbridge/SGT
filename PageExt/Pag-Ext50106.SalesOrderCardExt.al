pageextension 50106 SalesOrderCardExt extends "Sales Order"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("CRN No."; Rec."CRN No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the CRN No. field.';
                Editable = false;
            }
            field("End User"; Rec."End User")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the End User field.';
            }
            field("End User Code"; Rec."End User Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the End User Code field.';
            }
        }
    }

    actions
    {

        /*
        modify(CreatePurchaseOrder)
        {
            trigger OnAfterAction()
            var
                PurchaseHeaderRec: Record "Purchase Header";
            begin
                PurchaseHeaderRec.Reset();
                PurchaseHeaderRec.SetRange("Document Type", PurchaseHeaderRec."Document Type"::Order);
                PurchaseHeaderRec.SetRange("No.", Rec.);
                if SalesHDRec.FindFirst() then begin
                    SalesHDRec."CRN No." := Rec."CRN No.";
                    SalesHDRec.Modify(true);
                end;

                //Message('Test-', Rec."CRN No.");
            end;
        }
        */

    }
}
