pageextension 50109 "Sales Order Subform Ext" extends "Sales Order Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Employee No."; Rec."Employee No.")
            {
            }
        }
        modify("No.")
        {
            AssistEdit = true;
            trigger OnAssistEdit()
            var
                ItemList: Page "Item List";
                Item: Record Item;
                SetOfEmployee: Text;
            begin
                ItemList.LookupMode := true;
                if ItemList.RunModal() = Action::LookupOK then begin
                    Item.SetFilter("No.", ItemList.GetSelectionFilter());
                    If Item.FindSet() then
                        repeat
                            SetOfEmployee += Item."No." + '/';
                        until Item.Next() = 0;
                    Rec."No." := SetOfEmployee.Split('/').Get(1);
                end;
            end;
        }
    }
    actions
    {
        addafter(ExplodeBOM_Functions)
        {
            action("Split Lines by Employees")
            {
                ApplicationArea = All;
                Caption = 'Split Lines by Employee';
                Enabled = Rec."Employee No." > 1;
                Image = Splitlines;
                ToolTip = 'Divide the quantity of the item in the selected line according to the employees specified in the Employee No. field.';

                trigger OnAction()
                begin
                    SplitLinesByEmployees();
                end;
            }
        }
    }
    local procedure SplitLinesByEmployees()
    var
        NewSalesLines: Record "Sales Line";
        QuantityPerEmployee: Decimal;
        LineSpacing: Integer;
    begin
        QuantityPerEmployee := Rec.Quantity / Rec."Employee No.";

        repeat
            NewSalesLines.Init();
            NewSalesLines := Rec;
            LineSpacing += 1;
            NewSalesLines."Line No." := Rec."Line No." + LineSpacing;
            NewSalesLines.Quantity := QuantityPerEmployee;
            NewSalesLines.Insert(true);

            Rec.Quantity -= QuantityPerEmployee;
            Rec."Employee No." -= 1;
            Rec.Modify(true);
        until Rec."Employee No." = 1;
        CurrPage.Update(false);
    end;
}