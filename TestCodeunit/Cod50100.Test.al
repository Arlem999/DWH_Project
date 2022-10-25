codeunit 50100 "Test "
{
    Subtype = Test;

    trigger OnRun()
    begin
        IsInitialized := false;
    end;

    var
        IsInitialized: Boolean;

    local procedure Initialize()
    begin
        if IsInitialized then
            exit;

        CheckNoSeriesItemSetup();

        IsInitialized := true;
        Commit();
    end;

    local procedure CreateNoSeriesWithLine(): Code[10]
    var
        NoSeries: Record "No. Series";
    begin
        NoSeries.SetRange(Code, 'LUN-IT');
        If NoSeries.FindFirst() then
            exit(NoSeries.Code);
    end;

    local procedure CheckNoSeriesItemSetup()
    var
        InventirySetup: Record "Inventory Setup";
    begin
        InventirySetup.Get();
        If InventirySetup."Item Nos." = '' then begin
            InventirySetup.Validate("Item Nos.", CreateNoSeriesWithLine());
            InventirySetup.Modify(true);
        end;
    end;

    [Test]
    procedure CreateItemByPage()
    var
        ItemTemp: Record Item temporary;
    begin

    end;

    [ModalPageHandler]
    procedure CreateItemTemp(var Test: TestPage "Item Card")
    begin

    end;
}
