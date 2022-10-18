report 50100 "DWH Loading data"
{
    Caption = 'DWH Loading data Arlem';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem("DWH integration log Arlem"; "DWH integration log Arlem")
        {
        }
    }

    var

        ReqPage: Label 'Choose what you want to do before importing data';
        UploadMessage: Label 'Please Choose the Excel File: ';
        NoFileFoundMsg: Label 'File Not Found!';
        TempExcelBuffer: Record "Excel Buffer" temporary;
        FileName: text;
        SheetName: Text;

    local procedure ImportExcelFile()
    var
        FileMgt: Codeunit "File Management";
        IStream: InStream;
        FromFile: Text;
    begin
        UploadIntoStream(UploadMessage, '', '', FromFile, IStream);
        If FromFile <> '' then begin
            FileName := FileMgt.GetFileName(FromFile);
            SheetName := TempExcelBuffer.SelectSheetsNameStream(IStream);
        end else
            Error(NoFileFoundMsg);
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(IStream, SheetName);
        TempExcelBuffer.ReadSheet();
    end;

    local procedure ImportExcelData()
    var
        DWHintegLog: Record "DWH integration log Arlem";
        RowNo: Integer;
        ColNo: Integer;
        MaxRowNo: Integer;
        ExternalDocumentNo: Code[35];
        AccountNo: Code[35];
        PostingDate: Date;
        AmountLCY: Decimal;
        ShortcutDimension1Code: Code[20];
        LineNo: Integer;
    begin
        ImportExcelFile();

        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then
            MaxRowNo := TempExcelBuffer."Row No.";
        for RowNo := 2 to MaxRowNo do begin
            if GetValueAtCell(RowNo, 1) <> '' then begin
                "DWH integration log Arlem".Init();
                "DWH integration log Arlem".LineNo := 0;
                "DWH integration log Arlem".DebtorName := GetValueAtCell(RowNo, 2);
                "DWH integration log Arlem".DebtorTaxCode := GetValueAtCell(RowNo, 3);
                "DWH integration log Arlem".DebtorAddress := GetValueAtCell(RowNo, 4);
                "DWH integration log Arlem".CaseID := GetValueAtCell(RowNo, 5);
                "DWH integration log Arlem".CaseExpirationDate := EvaluateDate(GetValueAtCell(RowNo, 6));
                "DWH integration log Arlem".SDI := EvaluateDigit(GetValueAtCell(RowNo, 7));
                Evaluate("DWH integration log Arlem".DocumentType, EvaluateOption(GetValueAtCell(RowNo, 8)));
                "DWH integration log Arlem".TransactionID := GetValueAtCell(RowNo, 9);
                "DWH integration log Arlem".PortfolioID := IfNotNull(GetValueAtCell(RowNo, 10));
                "DWH integration log Arlem".PortfolioName := IfNotNull(GetValueAtCell(RowNo, 11));
                "DWH integration log Arlem".BatchID := IfNotNull(GetValueAtCell(RowNo, 12));
                "DWH integration log Arlem".BatchName := IfNotNull(GetValueAtCell(RowNo, 13));
                "DWH integration log Arlem".SegmentID := IfNotNull(GetValueAtCell(RowNo, 14));
                "DWH integration log Arlem".SegmentName := IfNotNull(GetValueAtCell(RowNo, 15));
                "DWH integration log Arlem".FlowID := GetValueAtCell(RowNo, 16);
                "DWH integration log Arlem".PostingDate := EvaluateDate(GetValueAtCell(RowNo, 17));
                "DWH integration log Arlem".CurrencyCode := IfNotNull(GetValueAtCell(RowNo, 18));
                "DWH integration log Arlem".Description := IfNotNull(GetValueAtCell(RowNo, 19));
                "DWH integration log Arlem"."GL\Local Account" := IfNotNull(GetValueAtCell(RowNo, 20));
                "DWH integration log Arlem".Amount := EvaluateDigit(GetValueAtCell(RowNo, 22));
                "DWH integration log Arlem".AccountType := GetValueAtCell(RowNo, 23);
                "DWH integration log Arlem".AccountNo := GetValueAtCell(RowNo, 24);
                "DWH integration log Arlem".BalAccountType := IfNotNull(GetValueAtCell(RowNo, 25));
                "DWH integration log Arlem".BalAccountNo := IfNotNull(GetValueAtCell(RowNo, 26));
                "DWH integration log Arlem".Correction := GetBoolean(GetValueAtCell(RowNo, 27));
                "DWH integration log Arlem".Invoiced := GetBoolean(GetValueAtCell(RowNo, 28));
                Evaluate("DWH integration log Arlem".meta_Chck, EvaluateOption(GetValueAtCell(RowNo, 29)));
                "DWH integration log Arlem".meta_MarteInsertDate := EvaluateDate(GetValueAtCell(RowNo, 30).Split(' ').Get(1));
                "DWH integration log Arlem".meta_DWHInsertDate := EvaluateDate(GetValueAtCell(RowNo, 31).Split(' ').Get(1));
                "DWH integration log Arlem".Insert();
            end;
        end;
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin

        TempExcelBuffer.Reset();
        If TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;

    local procedure EvaluateDigit(TextDecimal: Text): Decimal
    var
        Decimal: Decimal;
    begin
        Evaluate(Decimal, TextDecimal);
        exit(Decimal);
    end;

    local procedure EvaluateDate(TextDate: Text): Date
    var
        Date: Date;
    begin
        Evaluate(Date, TextDate);
        exit(Date);
    end;

    local procedure EvaluateOption(TextOption: Text): Text
    var
        Option: Text;
    begin
        if (TextOption <> 'Error - both empty') and (TextOption <> 'NULL') then begin
            Evaluate(Option, TextOption);
            exit(Option);
        end else begin
            Evaluate(Option, '');
            exit(Option);
        end;
    end;

    local procedure IfNotNull(Text: Text): Text
    begin
        If Text <> 'NULL' then
            exit(Text)
        else
            exit('');
    end;

    local procedure GetBoolean(Boolean: Text): Boolean
    begin
        If Boolean <> '1' then
            exit(false);
    end;

    trigger OnPostReport()
    var
        DWHintegerLog: Record "DWH integration log Arlem";
    begin

    end;

    trigger OnPreReport()
    begin
        ImportExcelData();
    end;
}
