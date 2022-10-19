page 50102 "DWH Integration Log Arlem"
{
    ApplicationArea = All;
    Caption = 'DWH Integration Log Arlem';
    PageType = List;
    SourceTable = "DWH Integration Log Arlem";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(LineNo; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field(DebtorName; Rec."Debtor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name of the Debtor field.';
                }
                field(DebtorTaxCode; Rec."Debtor Tax Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Debtor Tax Code field.';
                }
                field(DebtorAddress; Rec."Debtor Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Debtor Address field.';
                }
                field(CaseID; Rec."Case ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Case ID field.';
                    ExtendedDatatype = Masked;
                }
                field(CaseExpirationDate; Rec."Case Expiration Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Case Expiration Date field.';
                }
                field(SDI; Rec.SDI)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SDI field.';
                }
                field(DocumentType; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(TransactionID; Rec."Transaction ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TransactionID field.';
                }
                field(PortfolioID; Rec."Portfolio ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Portfolio ID field.';
                }
                field(PortfolioName; Rec."Portfolio Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Portfolio Name field.';
                }
                field(BatchID; Rec."Batch ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Batch ID field.';
                }
                field(BatchName; Rec."Batch Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Batch Name field.';
                }
                field(SegmentID; Rec."Segment ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Segment ID field.';
                }
                field(SegmentName; Rec."Segment Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Segment Name field.';
                }
                field(FlowID; Rec."Flow ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Flow ID field.';
                }
                field(PostingDate; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(CurrencyCode; Rec."Currency Code")
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
                field(AccountType; Rec."Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field(AccountNo; Rec."Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account No field.';
                }
                field(BalAccountType; Rec."Bal Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bal Account Type field.';
                }
                field(BalAccountNo; Rec."Bal Account No")
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
                field(meta_Chck; Rec."meta Chck")
                {
                    ApplicationArea = All;
                }
                field(meta_MarteInsertDate; Rec."meta Marte Insert Date")
                {
                    ApplicationArea = All;
                }
                field(meta_DWHInsertDate; Rec."meta DWH Insert Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Process All Data")
            {
                ApplicationArea = All;
                Caption = 'Process All Data';
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    DWHArchive: Record "DWH Integration Archive Arlem";
                    DWHProcessl: Report "DWH Data Processing";
                    ErrorMessage: Label 'Sorry there is nothing to do here';
                    ProcessSucess: Label 'Data is successfully procced.';
                begin
                    // if Rec.FindSet() then begin
                    //     repeat
                    //        // if DWHProcessl.CreateSalesHeader(Rec) and DWHProcessl.AddGenJournalLines(Rec) then begin
                    //             DWHArchive.TransferFields(Rec, true);
                    //             DWHArchive.Insert(true);
                    //         end;
                    //     until Rec.Next() = 0;
                    // end else
                    //     Message(ErrorMessage);
                    Rec.DeleteAll();
                    Message(ProcessSucess);
                end;
            }
            action("DWH Loading data")
            {
                ApplicationArea = All;
                Caption = 'DWH Loading data';
                Image = Download;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                PromotedIsBig = true;
                RunObject = report "DWH Loading Data";
            }
            action("DWH Setup")
            {
                ApplicationArea = All;
                Caption = 'DWH Setup';
                Image = Setup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                PromotedIsBig = true;
                RunObject = page "DWH Integration Setup Arlem";
            }
        }
    }
}
