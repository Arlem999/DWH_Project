pageextension 50102 "General Ledger Entries Ext" extends "General Ledger Entries"
{
    layout
    {
        addafter("Document No.")
        {
            field(CaseID; Rec."Case ID Arlem")
            {
            }
        }
    }
}
