table 50100 "DWH integration setup"
{
    Caption = 'DWH integration setup Arlem';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Api URL"; Text[100])
        {
            Caption = 'Api URL';
            DataClassification = ToBeClassified;
        }
        field(2; Login; Text[50])
        {
            Caption = 'Login';
            DataClassification = ToBeClassified;
        }
        field(3; Password; Code[30])
        {
            Caption = 'Password';
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;
        }
        field(4; "Default Gen. Bus. Post. Group"; Code[10])
        {
            Caption = 'Default Gen. Bus. Post. Group';
            DataClassification = ToBeClassified;
        }
        field(5; "Default VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'Default VAT Bus. Posting Group';
            DataClassification = ToBeClassified;
        }
        field(6; "Default Customer Posting Group"; Code[10])
        {
            Caption = 'Default Customer Posting Group';
            DataClassification = ToBeClassified;
        }
        field(7; "Expense Gen. Journal Template"; Code[10])
        {
            Caption = 'Expense Gen. Journal Template';
            DataClassification = ToBeClassified;
        }
        field(8; "Expense General Journal Batch"; Code[10])
        {
            Caption = 'Expense General Journal Batch';
            DataClassification = ToBeClassified;
        }
        field(9; "Payments Gen. Journal Template"; Code[10])
        {
            Caption = 'Payments Gen. Journal Template';
            DataClassification = ToBeClassified;
        }
        field(10; "Payments General Journal Batch"; Code[10])
        {
            Caption = 'Payments General Journal Batc';
            DataClassification = ToBeClassified;
        }
        field(11; "Invoice default G/L Account"; Code[10])
        {
            Caption = 'Invoice default G/L Account';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Api URL")
        {
            Clustered = true;
        }
    }
}
