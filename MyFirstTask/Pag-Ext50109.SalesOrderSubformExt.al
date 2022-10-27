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
            NewSalesLines.SetRange("Document Type", Rec."Document Type");
            NewSalesLines.SetRange("Document No.", Rec."Document No.");
            NewSalesLines.SetFilter("Line No.", '>%1', Rec."Line No.");

            if NewSalesLines.FindFirst() then begin
                LineSpacing := (NewSalesLines."Line No." - Rec."Line No.") div 2;
            end else
                LineSpacing := 10000;
            NewSalesLines.Reset();
            NewSalesLines.Init();
            NewSalesLines := Rec;
            NewSalesLines."Line No." := Rec."Line No." + LineSpacing;
            NewSalesLines.Quantity := QuantityPerEmployee;
            NewSalesLines.Insert();

            Rec.Quantity -= QuantityPerEmployee;
            Rec."Employee No." -= 1;
            Rec.Modify(true);
        until Rec."Employee No." = 1
    end;
}