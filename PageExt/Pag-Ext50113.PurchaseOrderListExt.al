pageextension 50113 PurchaseOrderListExt extends "Purchase Order List"
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
            }
        }
    }
}
