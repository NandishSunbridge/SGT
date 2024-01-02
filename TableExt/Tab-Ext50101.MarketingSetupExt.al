tableextension 50101 MarketingSetupExt extends "Marketing Setup"
{
    fields
    {
        field(50100; "CRN Number No. Series"; Code[10])
        {
            Caption = 'CRN Number No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
    }
}
