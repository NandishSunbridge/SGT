pageextension 50111 SalesReturnOrderListExt extends "Sales Return Order List"
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
        }
    }
}
