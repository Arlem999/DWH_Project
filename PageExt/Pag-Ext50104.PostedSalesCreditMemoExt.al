pageextension 50104 "Posted Sales Credit Memo Ext" extends "Posted Sales Credit Memo"
{
    layout
    {
        addafter("No.")
        {
            field(CaseID; Rec."Case ID Arlem")
            {
            }
        }
    }
}
