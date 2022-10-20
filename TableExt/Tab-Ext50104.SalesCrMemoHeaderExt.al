tableextension 50104 "Sales Cr.Memo Header Ext" extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50101; "Case ID Arlem"; Code[20])
        {
            Caption = 'Case ID Arlem';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer."Case ID Arlem" where("No." = field("Sell-to Customer No.")));
        }
    }
}
