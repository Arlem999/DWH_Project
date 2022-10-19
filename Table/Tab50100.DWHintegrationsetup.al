table 50100 "DWH integration setup Arlem"
{
    Caption = 'DWH integration setup Arlem';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Text[100])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(2; "Api URL"; Text[100])
        {
            Caption = 'Api URL';
            DataClassification = ToBeClassified;
        }
        field(3; Login; Text[50])
        {
            Caption = 'Login';
            DataClassification = ToBeClassified;
        }
        field(4; Password; Code[30])
        {
            Caption = 'Password';
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;
        }
        field(5; "Default Gen. Bus. Post. Group"; Code[10])
        {
            Caption = 'Default Gen. Bus. Post. Group';
            TableRelation = "Gen. Business Posting Group";
            DataClassification = ToBeClassified;
        }
        field(6; "Default VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'Default VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
            DataClassification = ToBeClassified;
        }
        field(7; "Default Customer Posting Group"; Code[10])
        {
            Caption = 'Default Customer Posting Group';
            TableRelation = "Customer Posting Group";
            DataClassification = ToBeClassified;
        }
        field(8; "Expense Gen. Journal Template"; Code[10])
        {
            Caption = 'Expense Gen. Journal Template';
            TableRelation = "Gen. Journal Template";
            DataClassification = ToBeClassified;
        }
        field(9; "Expense General Journal Batch"; Code[10])
        {
            Caption = 'Expense General Journal Batch';
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Expense Gen. Journal Template"));
            DataClassification = ToBeClassified;
        }
        field(10; "Payments Gen. Journal Template"; Code[10])
        {
            Caption = 'Payments Gen. Journal Template';
            TableRelation = "Gen. Journal Template";
            DataClassification = ToBeClassified;
        }
        field(11; "Payments General Journal Batch"; Code[10])
        {
            Caption = 'Payments General Journal Batc';
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Payments Gen. Journal Template"));
            DataClassification = ToBeClassified;
        }
        field(12; "Invoice default G/L Account"; Code[10])
        {
            Caption = 'Invoice default G/L Account';
            TableRelation = "G/L Account";
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
