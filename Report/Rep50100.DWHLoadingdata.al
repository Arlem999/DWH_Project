report 50100 "DWH Loading data"
{
    Caption = 'DWH Loading data Arlem';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem("DWH Integration Log Arlem"; "DWH Integration Log Arlem")
        {
        }
    }

    var
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
        RowNo: Integer;
        MaxRowNo: Integer;
    begin
        ImportExcelFile();

        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then
            MaxRowNo := TempExcelBuffer."Row No.";
        for RowNo := 2 to MaxRowNo do begin
            if GetValueAtCell(RowNo, 1) <> '' then begin
                "DWH Integration Log Arlem".Init();
                "DWH Integration Log Arlem"."Entry No." := 0;
                "DWH Integration Log Arlem"."Debtor Name" := GetValueAtCell(RowNo, 2);
                "DWH Integration Log Arlem"."Debtor Tax Code" := GetValueAtCell(RowNo, 3);
                "DWH Integration Log Arlem"."Debtor Address" := GetValueAtCell(RowNo, 4);
                "DWH Integration Log Arlem"."Case ID" := GetValueAtCell(RowNo, 5);
                "DWH Integration Log Arlem"."Case Expiration Date" := EvaluateDate(GetValueAtCell(RowNo, 6));
                "DWH Integration Log Arlem".SDI := EvaluateDigit(GetValueAtCell(RowNo, 7));
                Evaluate("DWH Integration Log Arlem"."Document Type", EvaluateOption(GetValueAtCell(RowNo, 8)));
                "DWH Integration Log Arlem"."Transaction ID" := GetValueAtCell(RowNo, 9);
                "DWH Integration Log Arlem"."Portfolio ID" := IfNotNull(GetValueAtCell(RowNo, 10));
                "DWH Integration Log Arlem"."Portfolio Name" := IfNotNull(GetValueAtCell(RowNo, 11));
                "DWH Integration Log Arlem"."Batch ID" := IfNotNull(GetValueAtCell(RowNo, 12));
                "DWH Integration Log Arlem"."Batch Name" := IfNotNull(GetValueAtCell(RowNo, 13));
                "DWH Integration Log Arlem"."Segment ID" := IfNotNull(GetValueAtCell(RowNo, 14));
                "DWH Integration Log Arlem"."Segment Name" := IfNotNull(GetValueAtCell(RowNo, 15));
                "DWH Integration Log Arlem"."Flow ID" := GetValueAtCell(RowNo, 16);
                "DWH Integration Log Arlem"."Posting Date" := EvaluateDate(GetValueAtCell(RowNo, 17));
                "DWH Integration Log Arlem"."Currency Code" := IfNotNull(GetValueAtCell(RowNo, 18));
                "DWH Integration Log Arlem".Description := IfNotNull(GetValueAtCell(RowNo, 19));
                "DWH Integration Log Arlem"."GL\Local Account" := IfNotNull(GetValueAtCell(RowNo, 20));
                "DWH Integration Log Arlem".Amount := EvaluateDigit(GetValueAtCell(RowNo, 22));
                "DWH Integration Log Arlem"."Account Type" := GetValueAtCell(RowNo, 23);
                "DWH Integration Log Arlem"."Account No." := GetValueAtCell(RowNo, 24);
                "DWH Integration Log Arlem"."Bal Account Type" := IfNotNull(GetValueAtCell(RowNo, 25));
                "DWH Integration Log Arlem"."Bal Account No" := IfNotNull(GetValueAtCell(RowNo, 26));
                "DWH Integration Log Arlem".Correction := GetBoolean(GetValueAtCell(RowNo, 27));
                "DWH Integration Log Arlem".Invoiced := GetBoolean(GetValueAtCell(RowNo, 28));
                Evaluate("DWH Integration Log Arlem"."meta Chck", EvaluateOption(GetValueAtCell(RowNo, 29)));
                "DWH Integration Log Arlem"."meta Marte Insert Date" := EvaluateDate(GetValueAtCell(RowNo, 30).Split(' ').Get(1));
                "DWH Integration Log Arlem"."meta DWH Insert Date" := EvaluateDate(GetValueAtCell(RowNo, 31).Split(' ').Get(1));
                "DWH Integration Log Arlem".Insert();
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

    trigger OnPreReport()
    begin
        ImportExcelData();
    end;
}
