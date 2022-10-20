report 50103 "DWH Data Processsing"
{
    Caption = 'DWH Data Processing Arlem';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    ProcessingOnly = true;
    UseRequestPage = false;

    var
        GenJournal: Record "Gen. Journal Line";
        Customer: Record Customer;
        GLAccount: Record "G/L Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesHeader: Record "Sales Header";
        DWHsetup: Record "DWH integration setup Arlem";
        DimensionCode: Code[20];
        DimensionValues: Record "Dimension Value";
        GenLedgerSetup: Record "General Ledger Setup";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";

    procedure CreateSalesHeader(DWHRecord: Record "DWH Integration Log Arlem"): Boolean
    begin
        SalesHeader.Init();
        if (DWHRecord."Document Type" = DWHRecord."Document Type"::Invoice) and (DWHRecord.Correction = false) and (DWHRecord.Invoiced = true) then
            SalesHeader.Validate("Document Type", SalesHeader."Document Type"::Invoice)
        else
            SalesHeader.Validate("Document Type", SalesHeader."Document Type"::"Credit Memo");
        SalesHeader.Validate("No.", NoSeriesMgt.GetNextNo(SalesHeader.GetNoSeriesCode(), DWHRecord."Posting Date", true));

        Customer.SetRange("Case ID", DWHRecord."Case ID");
        if (Customer.FindFirst) then
            SalesHeader.Validate("Sell-to Customer No.", Customer."No.")
        else begin
            CreateCustomer(DWHRecord);
            Customer.SetRange("Case ID", DWHRecord."Case ID");
            SalesHeader.Validate("Sell-to Customer No.", Customer."No.")
        end;

        SalesHeader.Validate("Posting Date", DWHRecord."Posting Date");
        SalesHeader.Validate("Document Date", DWHRecord."Posting Date");

        //if GetDimension()

        SalesHeader."Currency Code" := DWHRecord."Currency Code";
        SalesHeader.Validate("Posting Description", DWHRecord.Description + DWHRecord."Transaction ID");
        SalesHeader.Validate(Correction, DWHRecord.Correction);
        SalesHeader.Validate("Bal. Account Type");
        SalesHeader.Insert(true);

        CreateLines(DWHRecord);
    end;

    local procedure CreateLines(DWHRecord: Record "DWH Integration Log Arlem")
    var
        SalesLines: Record "Sales Line";
    begin
        SalesLines.Init();
        SalesLines.Validate("Line No.", 10000);
        SalesLines.Validate(Type, SalesLines.Type::"G/L Account");

        GLAccount.SetRange("No.", DWHsetup."Invoice default G/L Account");
        if (GLAccount.FindFirst) then
            SalesLines.Validate("No.", GLAccount."No.");

        SalesLines.Validate(Quantity, DWHRecord.Quantity);
        SalesLines.Validate("Amount Including VAT", DWHRecord.Amount);
        SalesLines.Insert();
    end;

    local procedure CreateCustomer(DWHRecord: Record "DWH Integration Log Arlem")
    var
        TaxCode: Integer;
    begin
        SalesReceivablesSetup.Get();
        Customer.Init();
        Customer."No." := NoSeriesMgt.GetNextNo(SalesReceivablesSetup."Customer Nos.", DWHRecord."Posting Date", true);
        Customer.Validate("Case ID", DWHRecord."Case ID");
        Customer.Validate(Name, DWHRecord."Debtor Name");

        if (Format(DWHRecord."Debtor Tax Code").Contains('-')) then begin
            Customer.Validate("Fiscal Code", Format(DWHRecord."Debtor Tax Code").Split('-').Get(1));
            Customer.Validate("VAT Registration No.", Format(DWHRecord."Debtor Tax Code").Split('-').Get(2));
        end else
            if Evaluate(TaxCode, DWHRecord."Debtor Tax Code") then
                Customer.Validate("VAT Registration No.", DWHRecord."Debtor Tax Code")
            else
                Customer.Validate("Fiscal Code", DWHRecord."Debtor Tax Code");

        if (DWHRecord."Debtor Address" <> '') then begin
            Customer.Validate(Address, DWHRecord."Debtor Address".Substring(1, StrLen(DWHRecord."Debtor Address") - 5));
            Customer.Validate("Post Code", DWHRecord."Debtor Address".Substring(StrLen(DWHRecord."Debtor Address") - 5));
        end;

        Customer.Validate("Case ID Expiration Date", DWHRecord."Case Expiration Date");
        Customer.Validate(SDI, DWHRecord.SDI);
        DWHsetup.Get();
        Customer.Validate("Gen. Bus. Posting Group", DWHsetup."Default Gen. Bus. Post. Group");
        Customer.Validate("VAT Bus. Posting Group", DWHsetup."Default VAT Bus. Posting Group");
        Customer.Validate("Customer Posting Group", DWHsetup."Default Customer Posting Group");
        Customer.Insert();
    end;

    local procedure CreateDimension(DWHRecord: Record "DWH Integration Log Arlem")
    var
        myInt: Integer;
    begin
        DimensionCode := GetDimension(DWHRecord);
        DimensionValues.Init;
        GenLedgerSetup.get();
        DimensionValues.SetRange("Dimension Code", GenLedgerSetup."Global Dimension 1 Code");
        DimensionValues.SetRange(Code, DimensionCode);
        if (DimensionValues.FindFirst) then begin
            SalesHeader."Shortcut Dimension 1 Code" := DimensionCode
        end else begin
            DimensionValues.Init();
            DimensionValues.Validate("Dimension Code", GenLedgerSetup."Global Dimension 1 Code");
            DimensionValues.Validate(Code, DimensionCode);
            DimensionValues.Validate(Name, DimensionCode);
            DimensionValues.Insert();
            SalesHeader."Shortcut Dimension 1 Code" := DimensionCode;
        end;
    end;

    procedure GetDimension(DWHRecord: Record "DWH Integration Log Arlem"): Code[20]
    var
        DimensionCode: Text[20];
    begin
        if DWHRecord."Portfolio ID" <> '' then
            DimensionCode := DWHRecord."Portfolio ID";
        if DWHRecord."Batch ID" <> '' then
            DimensionCode += DWHRecord."Batch ID";
        if DWHRecord."Segment ID" <> '' then begin
            DimensionCode += DWHRecord."Segment ID";
            if StrLen(DimensionCode) <> 7 then //// to do
                exit(DimensionCode);
        end else
            exit('000000');
    end;
}