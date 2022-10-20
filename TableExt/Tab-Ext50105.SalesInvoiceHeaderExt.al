tableextension 50105 "Sales Invoice Header Ext" extends "Sales Invoice Header"
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
