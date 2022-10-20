tableextension 50100 "Customer Ext" extends Customer
{
    fields
    {
        field(50100; "Case ID"; Text[20])
        {
            Caption = 'Case ID Arlem';
            DataClassification = ToBeClassified;
        }
        field(50101; "Case ID Expiration Date"; Date)
        {
            Caption = 'Case ID Expir Date Arlem';
            DataClassification = ToBeClassified;
        }
        field(50102; "Fiscal Code"; Text[15])
        {
            Caption = 'Fiscal Code Arlem';
            DataClassification = ToBeClassified;
        }
        field(50103; "SDI"; Integer)
        {
            Caption = 'SDI Arlem';
            DataClassification = ToBeClassified;
        }
    }
}
