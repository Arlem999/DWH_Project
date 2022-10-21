codeunit 50100 "Test "
{
    Subtype = Test;

    trigger OnRun()
    begin
        IsInitialized := false;
    end;

    var
        IsInitialized: Boolean;
    //  LibraryUtility: Codeunit "Library - Utility";

    local procedure Initialize()
    begin
        if IsInitialized then
            exit;

        IsInitialized := true;
    end;

    local procedure CreateNoSeriesWithLine(): Code[10]
    var
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
    begin

    end;
}
