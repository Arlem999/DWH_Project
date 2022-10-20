tableextension 50103 "G/L Entry Ext" extends "G/L Entry"
{
    fields
    {
        field(50102; "Case ID Arlem"; Code[20])
        {
            Caption = 'Case ID Arlem';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer."Case ID Arlem" where("No." = field("Source No.")));
        }
    }
}
