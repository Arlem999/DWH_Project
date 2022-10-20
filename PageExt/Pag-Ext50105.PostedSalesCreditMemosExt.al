pageextension 50105 "Posted Sales Credit Memos Ext" extends "Posted Sales Credit Memos"
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
