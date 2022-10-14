page 50101 "DWH integration archive log"
{
    ApplicationArea = All;
    Caption = 'DWH integration archive log';
    PageType = List;
    SourceTable = "DWH integration archive log";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(LineNo; Rec.LineNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field(DebtorName; Rec.DebtorName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name of the Debtor field.';
                }
                field(DebtorTaxCode; Rec.DebtorTaxCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Debtor Tax Code field.';
                }
                field(DebtorAddress; Rec.DebtorAddress)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Debtor Address field.';
                }
                field(CaseID; Rec.CaseID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Case ID field.';
                    ExtendedDatatype = Masked;
                }
                field(CaseExpirationDate; Rec.CaseExpirationDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Case Expiration Date field.';
                }
                field(SDI; Rec.SDI)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SDI field.';
                }
                field(DocumentType; Rec.DocumentType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(TransactionID; Rec.TransactionID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TransactionID field.';
                }
                field(PortfolioID; Rec.PortfolioID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Portfolio ID field.';
                }
                field(PortfolioName; Rec.PortfolioName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Portfolio Name field.';
                }
                field(BatchID; Rec.BatchID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Batch ID field.';
                }
                field(BatchName; Rec.BatchName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Batch Name field.';
                }
                field(SegmentID; Rec.SegmentID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Segment ID field.';
                }
                field(SegmentName; Rec.SegmentName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Segment Name field.';
                }
                field(FlowID; Rec.FlowID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Flow ID field.';
                }
                field(PostingDate; Rec.PostingDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(CurrencyCode; Rec.CurrencyCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("GL\Local Account"; Rec."GL\Local Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the GL\Local Account field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(AccountType; Rec.AccountType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field(AccountNo; Rec.AccountNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account No field.';
                }
                field(BalAccountType; Rec.BalAccountType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bal Account Type field.';
                }
                field(BalAccountNo; Rec.BalAccountNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bal Account No field.';
                }
                field(Correction; Rec.Correction)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bal Account No field.';
                }
                field(Invoiced; Rec.Invoiced)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoiced field.';
                }
                field(meta_Chck; Rec.meta_Chck)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the meta_Chck field.';
                }
                field(meta_MarteInsertDate; Rec.meta_MarteInsertDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the meta_MarteInsertDate field.';
                }
                field(meta_DWHInsertDate; Rec.meta_DWHInsertDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the meta_DWHInsertDate field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
            }
        }
    }
}
