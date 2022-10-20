tableextension 50102 "Cust. Ledger Entry Ext" extends "Cust. Ledger Entry"
{
    fields
    {
        field(50101; "Case ID Arlem"; Code[20])
        {
            Caption = 'Case ID Arlem';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer."Case ID Arlem" where("No." = field("Customer No.")));
        }
    }
}
