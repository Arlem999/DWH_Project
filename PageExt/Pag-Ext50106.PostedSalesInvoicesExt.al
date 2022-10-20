pageextension 50106 "Posted Sales Invoices Ext" extends "Posted Sales Invoices"
{
    layout
    {
        addafter("No.")
        {
            field(CaseID; Rec."Case ID")
            {
            }
        }
    }
}
