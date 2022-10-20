tableextension 50102 "Cust. Ledger Entry Ext" extends "Cust. Ledger Entry"
{
    fields
    {
        field(50101; "Case ID"; Code[20])
        {
            Caption = 'Case ID Arlem';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer."Case ID" where("No." = field("Customer No.")));
        }
    }
}
