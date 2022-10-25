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
        field(5; "Default Gen. Bus. Post. Group"; Code[20])
        {
            Caption = 'Default Gen. Bus. Post. Group';
            TableRelation = "Gen. Business Posting Group";
            DataClassification = ToBeClassified;
        }
        field(6; "Default VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'Default VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
            DataClassification = ToBeClassified;
        }
        field(7; "Default Customer Posting Group"; Code[20])
        {
            Caption = 'Default Customer Posting Group';
            TableRelation = "Customer Posting Group";
            DataClassification = ToBeClassified;
        }
        field(8; "Expense Gen. Journal Template"; Code[20])
        {
            Caption = 'Expense Gen. Journal Template';
            TableRelation = "Gen. Journal Template";
            DataClassification = ToBeClassified;
        }
        field(9; "Expense General Journal Batch"; Code[20])
        {
            Caption = 'Expense General Journal Batch';
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Expense Gen. Journal Template"));
            DataClassification = ToBeClassified;
        }
        field(10; "Payments Gen. Journal Template"; Code[20])
        {
            Caption = 'Payments Gen. Journal Template';
            TableRelation = "Gen. Journal Template";
            DataClassification = ToBeClassified;
        }
        field(11; "Payments General Journal Batch"; Code[20])
        {
            Caption = 'Payments General Journal Batc';
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Payments Gen. Journal Template"));
            DataClassification = ToBeClassified;
        }
        field(12; "Invoice default G/L Account"; Code[20])
        {
            Caption = 'Invoice default G/L Account';
            TableRelation = "G/L Account";
            DataClassification = ToBeClassified;
        }
        field(13; "Default Bank Account"; Code[20])
        {
            Caption = 'Default Bank Account';
            TableRelation = "Bank Account";
            DataClassification = ToBeClassified;
        }
        field(14; "Default Exp Debit G/L Account"; Code[20])
        {
            Caption = 'Default Exp Debit G/L Account';
            TableRelation = "G/L Account";
            DataClassification = ToBeClassified;
        }
        field(15; "Default Exp Credit G/L Account"; Code[20])
        {
            Caption = 'Default Exp Credit G/L Account';
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
