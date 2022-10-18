report 50102 "DWH Del personalDataOf debtors"
{
    Caption = 'DWH Del personalDataOf debtors Arlem';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    ProcessingOnly = true;

    dataset
    {
        // dataitem(; "")
        // {
        // }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
