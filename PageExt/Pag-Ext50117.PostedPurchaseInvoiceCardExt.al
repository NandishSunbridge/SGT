pageextension 50117 PostedPurchaseInvoiceCardExt extends "Posted Purchase Invoice"
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
