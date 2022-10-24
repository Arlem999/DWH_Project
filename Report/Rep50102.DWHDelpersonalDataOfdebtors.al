report 50102 "DWH Del personalDataOf debtors"
{
    Caption = 'DWH Del personalDataOf debtors Arlem';
    UseRequestPage = false;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
        }
    }

    var
        Info: Label 'You cannot delete the debtor`s %1 personal data, because Case ID expired data are not over yet';
        Success: Label 'Data deletion successfully completed';

    trigger OnPreReport()
    begin
        if Customer.FindSet() then begin
            repeat
                if (Customer."Case ID Expiration Date Arlem" <> 0D) then
                    if (Customer."Case ID Expiration Date Arlem" < WorkDate()) then begin
                        Customer.Name := '****';
                        Customer.Address := '****';
                        Customer."Post Code" := '****';
                        Customer."Fiscal Code Arlem" := '****';
                        Customer.Modify();
                    end else
                        Message(Info, Customer.Name);
            until Customer.Next() = 0;
            Message(Success);
        end;
    end;
}
