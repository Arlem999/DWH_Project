report 50101 "DWH Data Processing"
{
    Caption = 'DWH Data Processing Arlem';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    ProcessingOnly = true;
    UseRequestPage = false;

    var
        GenJournal: Record "Gen. Journal Line";
        Customer: Record Customer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesHeader: Record "Sales Header";
        DWHsetup: Record "DWH integration setup Arlem";
        DimensionValues: Record "Dimension Value";
        GenLedgerSetup: Record "General Ledger Setup";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        DimensValue: Label 'PORTAFOGLIO';
        DimensionCode: Code[20];

    procedure CreateSalesHeader(DWHRecord: Record "DWH Integration Log Arlem"): Boolean
    begin
        SalesHeader.Init();
        if (DWHRecord."Document Type" = DWHRecord."Document Type"::Invoice) and (DWHRecord.Correction = false) and (DWHRecord.Invoiced = true) then
            SalesHeader.Validate("Document Type", SalesHeader."Document Type"::Invoice)
        else
            SalesHeader.Validate("Document Type", SalesHeader."Document Type"::"Credit Memo");

        SalesHeader.Validate("No.", NoSeriesMgt.GetNextNo(SalesHeader.GetNoSeriesCode(), DWHRecord."Posting Date", true));
        SalesHeader.Validate("Posting Date", DWHRecord."Posting Date");
        SalesHeader.Validate("Document Date", DWHRecord."Posting Date");
        SalesHeader."Currency Code" := DWHRecord."Currency Code";
        SalesHeader.Validate("Posting Description", DWHRecord.Description + DWHRecord."Transaction ID");
        SalesHeader.Validate(Correction, DWHRecord.Correction);
        SalesHeader.Validate("Bal. Account Type");

        Customer.SetRange("Case ID Arlem", DWHRecord."Case ID");
        if (Customer.FindFirst) then
            SalesHeader.Validate("Sell-to Customer No.", Customer."No.")
        else begin
            CreateCustomer(DWHRecord);
            Customer.Reset();
            Customer.SetRange("Case ID Arlem", DWHRecord."Case ID");
            SalesHeader.Validate("Sell-to Customer No.", Customer."No.");
        end;

        If (SalesHeader.Insert(true)) then begin
            CreateDimension(DWHRecord);
            SalesHeader.ValidateShortcutDimCode(GetShortcutFieldNo(DimensValue), DimensionCode);
            SalesHeader.Modify();
            if CreateLines(DWHRecord) then
                exit(true);
        end;
    end;

    local procedure CreateLines(DWHRecord: Record "DWH Integration Log Arlem"): Boolean
    var
        SalesLines: Record "Sales Line";
    begin
        SalesLines.Init();
        SalesLines.Validate("Line No.", 10000);
        SalesLines.Validate("Document Type", SalesHeader."Document Type");
        SalesLines."Document No." := SalesHeader."No.";
        SalesLines.Validate(Type, SalesLines.Type::"G/L Account");
        SalesLines.Validate("No.", DWHsetup."Invoice default G/L Account");
        SalesLines.Validate(Quantity, DWHRecord.Quantity);
        SalesLines.Validate("Amount Including VAT", DWHRecord.Amount);
        if SalesLines.Insert() then
            exit(true);
    end;

    local procedure CreateCustomer(DWHRecord: Record "DWH Integration Log Arlem")
    var
        TaxCode: Integer;
    begin
        SalesReceivablesSetup.Get();
        Customer.Init();
        Customer."No." := NoSeriesMgt.GetNextNo(SalesReceivablesSetup."Customer Nos.", DWHRecord."Posting Date", true);
        Customer.Validate("Case ID Arlem", DWHRecord."Case ID");
        Customer.Validate(Name, DWHRecord."Debtor Name");

        if (Format(DWHRecord."Debtor Tax Code").Contains('-')) then begin
            Customer.Validate("Fiscal Code Arlem", Format(DWHRecord."Debtor Tax Code").Split('-').Get(1).Remove(1));
            Customer.Validate("VAT Registration No.", Format(DWHRecord."Debtor Tax Code").Split('-').Get(2));
        end else
            if Evaluate(TaxCode, DWHRecord."Debtor Tax Code") then
                Customer.Validate("VAT Registration No.", DWHRecord."Debtor Tax Code")
            else
                Customer.Validate("Fiscal Code Arlem", Format(DWHRecord."Debtor Tax Code").Remove(1));

        if (DWHRecord."Debtor Address" <> '  ') then begin
            Customer.Validate(Address, DWHRecord."Debtor Address".Substring(1, StrLen(DWHRecord."Debtor Address") - 5));
            Customer.Validate("Post Code", DWHRecord."Debtor Address".Substring(StrLen(DWHRecord."Debtor Address") - 5));
        end;
        Customer.Validate("Case ID Expiration Date Arlem", DWHRecord."Case Expiration Date");
        Customer.Validate("SDI Arlem", DWHRecord.SDI);
        DWHsetup.Get();
        Customer.Validate("Gen. Bus. Posting Group", DWHsetup."Default Gen. Bus. Post. Group");
        Customer.Validate("VAT Bus. Posting Group", DWHsetup."Default VAT Bus. Posting Group");
        Customer.Validate("Customer Posting Group", DWHsetup."Default Customer Posting Group");
        Customer.Insert(true);
    end;

    procedure GetShortcutFieldNo(DimensionCode: Code[20]): Integer
    begin
        GenLedgerSetup.get();
        if (GenLedgerSetup."Shortcut Dimension 1 Code" = DimensionCode) then
            exit(1);
        if (GenLedgerSetup."Shortcut Dimension 2 Code" = DimensionCode) then
            exit(2);
        if (GenLedgerSetup."Shortcut Dimension 3 Code" = DimensionCode) then
            exit(3);
        if (GenLedgerSetup."Shortcut Dimension 4 Code" = DimensionCode) then
            exit(4);
        if (GenLedgerSetup."Shortcut Dimension 5 Code" = DimensionCode) then
            exit(5);
        if (GenLedgerSetup."Shortcut Dimension 6 Code" = DimensionCode) then
            exit(6);
        if (GenLedgerSetup."Shortcut Dimension 7 Code" = DimensionCode) then
            exit(7);
        if (GenLedgerSetup."Shortcut Dimension 8 Code" = DimensionCode) then
            exit(8);
    end;

    procedure CreateDimension(DWHRecord: Record "DWH integration log Arlem"): code[20]
    begin
        if (DWHRecord."Portfolio ID" <> '') and (DWHRecord."Batch ID" <> '') and (DWHRecord."Segment ID" <> '') then
            Evaluate(DimensionCode, '000' + (DWHRecord."Portfolio ID") + '.00' + DWHRecord."Batch ID" + '.0' + DWHRecord."Segment ID")
        else
            DimensionCode := '000000';

        DimensionValues.SetRange("Dimension Code", DimensValue);
        DimensionValues.SetRange(Code, DimensionCode);
        if not DimensionValues.FindFirst then begin
            DimensionValues.Init;
            DimensionValues.Validate("Dimension Code", DimensValue);
            DimensionValues.Validate(Code, DimensionCode);
            DimensionValues.Validate(Name, DimensionCode);
            DimensionValues.Insert(true);
        end else begin
            DimensionValues.Validate("Dimension Code", DimensValue);
            DimensionValues.Validate(Code, DimensionCode);
            DimensionValues.Validate(Name, DimensionCode);
            DimensionValues.Modify(true);
        end;
        exit(DimensionCode);
    end;

    procedure CreateGenJournalLines(DWHRecord: Record "DWH integration log Arlem"): Boolean
    var
        LineNo: Integer;
    begin
        GenJournal.SetRange("Journal Template Name", DWHsetup."Expense Gen. Journal Template");
        GenJournal.SetRange("Journal Batch Name", DWHsetup."Expense General Journal Batch");
        if GenJournal.FindLast() then
            LineNo := GenJournal."Line No.";

        DWHsetup.Get();
        GenJournal.Init();
        GenJournal.Validate("Journal Template Name", DWHsetup."Expense Gen. Journal Template");
        GenJournal.Validate("Journal Batch Name", DWHsetup."Expense General Journal Batch");
        GenJournal.Validate("Line No.", LineNo + 10000);
        GenJournal.Validate("Posting Date", WorkDate());
        GenJournal.Validate("Document No.", DWHRecord."Transaction ID");

        if (DWHRecord."Document Type" = DWHRecord."Document Type"::Payment) then begin
            GenJournal.Validate("Document Type", GenJournal."Document Type"::Payment);
            GenJournal.Validate("Account Type", GenJournal."Account Type"::"G/L Account");
            Customer.SetRange("Case ID Arlem", DWHRecord."Case ID");
            if (Customer.FindFirst) then
                GenJournal."Account No." := Customer."No.";
            GenJournal.Validate("Bal. Account Type", GenJournal."Bal. Account Type"::"Bank Account");
            GenJournal.Validate("Bal. Account No.", DWHsetup."Default Bank Account");
        end else begin
            GenJournal.Validate("Document Type", DWHRecord."Document Type"::Refund);
            GenJournal.Validate("Account Type", GenJournal."Account Type"::Customer);
            GenJournal.Validate("Account No.", DWHsetup."Default Exp Debit G/L Account");
            GenJournal.Validate("Bal. Account Type", GenJournal."Bal. Account Type"::"Bank Account");
            GenJournal.Validate("Bal. Account No.", DWHsetup."Default Exp Credit G/L Account");
        end;

        GenJournal.Validate(Description, DWHRecord.Description);
        GenJournal.Validate("Case ID Arlem", DWHRecord."Case ID");
        GenJournal."Currency Code" := DWHRecord."Currency Code";
        if (DWHRecord."Document Type" = DWHRecord."Document Type"::Payment) then
            DWHRecord.Amount := (-1) * DWHRecord.Amount;
        GenJournal.ValidateShortcutDimCode(GetShortcutFieldNo(DimensValue), DimensionCode);
        GenJournal.Validate(Amount, DWHRecord.Amount);
        if GenJournal.Insert() then
            exit(true);
    end;
}