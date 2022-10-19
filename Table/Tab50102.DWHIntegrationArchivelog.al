table 50102 "DWH integration archive Arlem"
{
    Caption = 'DWH integration archive log Arlem';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                "Entry No." += Rec.Count;
            end;
        }
        field(2; "Debtor Name"; Text[30])
        {
            Caption = 'Name of the Debtor';
        }
        field(3; "Debtor Tax Code"; Code[30])
        {
            Caption = 'Debtor Tax Code';
        }
        field(4; "Debtor Address"; Text[250])
        {
            Caption = 'Debtor Address';
        }
        field(5; "Case ID"; Text[20])
        {
            Caption = 'Case ID';
            DataClassification = ToBeClassified;
        }
        field(6; "Case Expiration Date"; Date)
        {
            Caption = 'Case Expiration Date';
            DataClassification = ToBeClassified;
        }
        field(7; SDI; Integer)
        {
            Caption = 'SDI';
            DataClassification = ToBeClassified;
        }
        field(8; "Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            OptionMembers = "Payment","Refund","Invoice";
        }
        field(9; "Transaction ID"; Text[20])
        {
            Caption = 'TransactionID';
            DataClassification = ToBeClassified;
        }
        field(10; "Portfolio ID"; Code[6])
        {
            Caption = 'Portfolio ID';
            DataClassification = ToBeClassified;
        }
        field(11; "Portfolio Name"; Code[6])
        {
            Caption = 'Portfolio Name';
            DataClassification = ToBeClassified;
        }
        field(12; "Batch ID"; Code[6])
        {
            Caption = 'Batch ID';
            DataClassification = ToBeClassified;
        }
        field(13; "Batch Name"; Text[50])
        {
            Caption = 'Batch Name';
            DataClassification = ToBeClassified;
        }
        field(14; "Segment ID"; Text[50])
        {
            Caption = 'Segment ID';
            DataClassification = ToBeClassified;
        }
        field(15; "Segment Name"; Text[50])
        {
            Caption = 'Segment Name';
            DataClassification = ToBeClassified;
        }
        field(16; "Flow ID"; Text[50])
        {
            Caption = 'Flow ID';
            DataClassification = ToBeClassified;
        }
        field(17; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }
        field(18; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
        }
        field(19; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(20; "GL\Local Account"; Code[20])
        {
            Caption = 'GL\Local Account';
            DataClassification = ToBeClassified;
        }
        field(21; Quantity; Integer)
        {
            InitValue = 1;
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }
        field(22; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
        field(23; "Account Type"; Code[20])
        {
            Caption = 'Account Type';
            DataClassification = ToBeClassified;
        }
        field(24; "Account No."; Code[20])
        {
            Caption = 'Account No';
            DataClassification = ToBeClassified;
        }
        field(25; "Bal Account Type"; Code[20])
        {
            Caption = 'Bal Account Type';
            DataClassification = ToBeClassified;
        }
        field(26; "Bal Account No"; Code[20])
        {
            Caption = 'Bal Account No';
            DataClassification = ToBeClassified;
        }
        field(27; "Correction"; Boolean)
        {
            Caption = 'Bal Account No';
            DataClassification = ToBeClassified;
        }
        field(28; Invoiced; Boolean)
        {
            Caption = 'Invoiced';
            DataClassification = ToBeClassified;
        }
        field(29; "meta Chck"; Option)
        {
            Caption = 'meta_Chck';
            OptionMembers = "Payment","Invoice","Expense";
            DataClassification = ToBeClassified;
        }
        field(30; "meta Marte Insert Date"; Date)
        {
            Caption = 'meta MarteInsertDate';
            DataClassification = ToBeClassified;
        }
        field(31; "meta DWH Insert Date"; Date)
        {
            Caption = 'meta DWHInsertDate';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}

