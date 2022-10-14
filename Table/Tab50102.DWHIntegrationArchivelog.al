table 50102 "DWH integration archive log"
{
    Caption = 'DWH integration archive log Arlem';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; LineNo; Integer)
        {
            Caption = 'Line No';
            DataClassification = ToBeClassified;
        }
        field(2; DebtorName; Text[30])
        {
            Caption = 'Name of the Debtor';
            DataClassification = ToBeClassified;
        }
        field(3; DebtorTaxCode; Code[30])
        {
            Caption = 'Debtor Tax Code';
            DataClassification = ToBeClassified;
        }
        field(4; DebtorAddress; Text[250])
        {
            Caption = 'Debtor Address';
            DataClassification = ToBeClassified;
        }
        field(5; CaseID; Text[20])
        {
            Caption = 'Case ID';
            DataClassification = ToBeClassified;
        }
        field(6; CaseExpirationDate; Date)
        {
            Caption = 'Case Expiration Date';
            DataClassification = ToBeClassified;
        }
        field(7; SDI; Integer)
        {
            Caption = 'SDI';
            DataClassification = ToBeClassified;
        }
        field(8; "DocumentType"; Option)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            OptionMembers = "'h'","'i'";   ///// to do
        }
        field(9; TransactionID; Text[20])
        {
            Caption = 'TransactionID';
            DataClassification = ToBeClassified;
        }
        field(10; PortfolioID; Code[6])
        {
            Caption = 'Portfolio ID';
            DataClassification = ToBeClassified;
        }
        field(11; PortfolioName; Code[6])
        {
            Caption = 'Portfolio Name';
            DataClassification = ToBeClassified;
        }
        field(12; BatchID; Code[6])
        {
            Caption = 'Batch ID';
            DataClassification = ToBeClassified;
        }
        field(13; BatchName; Text[50])
        {
            Caption = 'Batch Name';
            DataClassification = ToBeClassified;
        }
        field(14; SegmentID; Text[50])
        {
            Caption = 'Segment ID';
            DataClassification = ToBeClassified;
        }
        field(15; SegmentName; Text[50])
        {
            Caption = 'Segment Name';
            DataClassification = ToBeClassified;
        }
        field(16; FlowID; Text[50])
        {
            Caption = 'Flow ID';
            DataClassification = ToBeClassified;
        }
        field(17; PostingDate; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }
        field(18; CurrencyCode; Code[10])
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
        field(23; "AccountType"; Code[20])
        {
            Caption = 'Account Type';
            DataClassification = ToBeClassified;
        }
        field(24; "AccountNo"; Code[20])
        {
            Caption = 'Account No';
            DataClassification = ToBeClassified;
        }
        field(25; "BalAccountType"; Code[20])
        {
            Caption = 'Bal Account Type';
            DataClassification = ToBeClassified;
        }
        field(26; "BalAccountNo"; Code[20])
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
        field(29; meta_Chck; Text[10]) /// to do?
        {
            Caption = 'meta_Chck';
            DataClassification = ToBeClassified;
        }
        field(30; meta_MarteInsertDate; Date)
        {
            Caption = 'meta_MarteInsertDate';
            DataClassification = ToBeClassified;
        }
        field(31; meta_DWHInsertDate; Date)
        {
            Caption = 'meta_DWHInsertDate';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; LineNo)
        {
            Clustered = true;
        }
    }
}
