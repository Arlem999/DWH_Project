pageextension 50101 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field(CaseID; Rec."Case ID Arlem")
            {
            }
            field("Case ID Expiration Date"; Rec."Case ID Expiration Date Arlem")
            {
            }
        }

        addafter(Blocked)
        {

            field("Fiscal Code"; Rec."Fiscal Code Arlem")
            {
            }
            field(SDI; Rec."SDI Arlem")
            {
            }
        }
    }
    actions
    {
        addafter(ApplyTemplate)
        {
            action("Clear client's personal data")
            {
                Caption = 'Clear personal data Arlem';
                Image = ClearLog;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                begin
                    Message('"Hello"');
                end;
            }
        }
    }
}
