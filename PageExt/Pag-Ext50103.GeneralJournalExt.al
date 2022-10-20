pageextension 50103 "General Journal Ext" extends "General Journal"
{
    layout
    {
        addafter("Document No.")
        {
            field(CaseID; Rec."Case ID")
            {
            }
        }
    }
}
