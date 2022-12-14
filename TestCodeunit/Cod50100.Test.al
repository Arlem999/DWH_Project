codeunit 50100 "Test "
{
    Subtype = Test;

    trigger OnRun()
    begin
        IsInitialized := false;
    end;

    var
        IsInitialized: Boolean;
        LibraryUtility: Codeunit "Library - Utility";
        LibraryERM: Codeunit "Library - ERM";

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
        NoSeriesLine: Record "No. Series Line";
    begin
        LibraryUtility.CreateNoSeries(NoSeries, true, true, true);
        LibraryUtility.CreateNoSeriesLine(NoSeriesLine, NoSeries.Code, NoSeries.Code, '');
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
    [HandlerFunctions('ConfigTempHandler')]
    procedure CreateItemByPage()
    var
        ItemTemp: Record Item temporary;
    begin
        //Setup
        Initialize();
        CreateItemTemp(ItemTemp);

        //Exercise
        CreateItemCard(ItemTemp);

        //Verify
        VerifyItem(ItemTemp);
    end;

    local procedure CreateItemTemp(ItemTemp: Record Item temporary)
    var
        InventoryPostGroup: Record "Inventory Posting Group";
        GeneralPostSetup: Record "General Posting Setup";
        VATPostingSetup: Record "VAT Posting Setup";
    begin
        LibraryERM.FindGeneralPostingSetup(GeneralPostSetup);
        LibraryERM.FindVATPostingSetup(VATPostingSetup, VATPostingSetup."VAT Calculation Type"::"Normal VAT");
        InventoryPostGroup.FindFirst();
        ItemTemp.Init;
        ItemTemp.Insert(true);
        ItemTemp.Validate("Inventory Posting Group", InventoryPostGroup.Code);
        ItemTemp.Validate("Gen. Prod. Posting Group", GeneralPostSetup."Gen. Prod. Posting Group");
        ItemTemp.Validate("VAT Prod. Posting Group", VATPostingSetup."VAT Prod. Posting Group");
    end;

    local procedure CreateItemCard(var Item: Record Item)
    var
        ItemCard: TestPage "Item Card";
    begin
        ItemCard.OpenNew();
        ItemCard."Gen. Prod. Posting Group".SetValue(Item."Gen. Prod. Posting Group");
        ItemCard."VAT Prod. Posting Group".SetValue(Item."VAT Prod. Posting Group");
        ItemCard."Inventory Posting Group".SetValue(Item."Inventory Posting Group");
        Item."No." := ItemCard."No.".Value;
        ItemCard.Ok.Invoke();
    end;

    local procedure VerifyItem(Item: Record Item)
    var
        Item2: Record Item;
    begin
        Item2.Get(Item."No.");
        Item2.TestField("Gen. Prod. Posting Group", Item."Gen. Prod. Posting Group");
        Item2.TestField("VAT Prod. Posting Group", Item."VAT Prod. Posting Group");
        Item2.TestField("Inventory Posting Group", Item."Inventory Posting Group");
    end;

    [ModalPageHandler]
    procedure ConfigTempHandler(var ConfigTempl: TestPage "Config Templates")
    begin
        if ConfigTempl.First() then
            ConfigTempl.Ok.Invoke();
    end;
}
