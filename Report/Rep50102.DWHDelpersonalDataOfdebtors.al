report 50102 "DWH Del personalDataOf debtors"
{
    Caption = 'DWH Del personalDataOf debtors Arlem';
    UseRequestPage = false;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            trigger OnPreDataItem()
            begin
                Customer.SetFilter("Case ID Expiration Date Arlem", '<%1', WorkDate());
            end;

            trigger OnAfterGetRecord()
            begin
                if Customer.FindSet() then
                    ChangeCustData();
            end;
        }
    }

    procedure TransferFields(DWHLog: Record "DWH integration archive Arlem")
    var
        ErrorMessage: Label 'Sorry there is nothing to do here';
        ProcessSucess: Label 'Data is successfully procced.';
    begin
        if DWHLog.FindSet() then begin
            repeat
                DWHLog.TransferFields(DWHLog, true);
                DWHLog.Insert();
                DWHLog.Delete();
            until DWHLog.Next() = 0;
        end else
            Message(ErrorMessage);
        Message(ProcessSucess);
    end;

    local procedure ChangeCustData()
    var
        Info: Label 'You cannot delete the debtor`s %1 personal data, because Case ID expired data are not over yet';
        Success: Label 'Data deletion successfully completed';
    begin
        repeat
            if (Customer."Case ID Expiration Date Arlem" <> 0D) then begin
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
}
