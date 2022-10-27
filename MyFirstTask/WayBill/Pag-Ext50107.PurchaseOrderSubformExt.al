pageextension 50107 "Purchase Order Subform Ext" extends "Purchase Order Subform"
{
    actions
    {
        addafter(OrderTracking)
        {
            action("Create Cross Reference")
            {
                ApplicationArea = All;
                Caption = 'Create Cross Reference';
                Enabled = (Rec.Type = Rec.Type::"Empl. Purchase"); // and not empty
                Image = ReferenceData;
                ToolTip = 'Create RS.GE Cross Reference for selected line with barcode.';

                trigger OnAction()
                var
                    Txt001: Label 'The cross reference you are creating already exists in the RS.GE Cross Reference table. Do you want to overwrite it?';
                begin
                    CurrPage.SetSelectionFilter(Rec);

                    // RS.GE Cross Reference.Cross-Reference Type = Vendor
                    // RS.GE Cross Reference.Cross-Reference Type No. = Waybill Header.Vendor No.
                    // RS.GE Cross Reference.Cross-Reference No. = Waybill Line.Barcode
                    // RS.GE Cross Reference.Type = Waybill Line.Type
                    // RS.GE Cross Reference.No = Waybill Line.No


                end;
            }
        }
    }
}
