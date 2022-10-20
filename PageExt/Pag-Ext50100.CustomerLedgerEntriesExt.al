pageextension 50100 "Customer Ledger Entries Ext" extends "Customer Ledger Entries"
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
