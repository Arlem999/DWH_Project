page 50100 "DWH integration setup"
{
    Caption = 'DWH integration setup';
    PageType = Card;
    SourceTable = "DWH integration setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Api URL"; Rec."Api URL")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Api URL field.';
                }
                field(Login; Rec.Login)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Login field.';
                }
                field(Password; Rec.Password)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Password field.';
                }
                field("Default Gen. Bus. Post. Group"; Rec."Default Gen. Bus. Post. Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default Gen. Bus. Post. Group field.';
                }
                field("Default VAT Bus. Posting Group"; Rec."Default VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default VAT Bus. Posting Group field.';
                }
                field("Default Customer Posting Group"; Rec."Default Customer Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default Customer Posting Group field.';
                }
                field("Expense Gen. Journal Template"; Rec."Expense Gen. Journal Template")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expense Gen. Journal Template field.';
                }
                field("Expense General Journal Batch"; Rec."Expense General Journal Batch")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expense General Journal Batch field.';
                }
                field("Payments Gen. Journal Template"; Rec."Payments Gen. Journal Template")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payments Gen. Journal Template field.';
                }
                field("Payments General Journal Batch"; Rec."Payments General Journal Batch")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payments General Journal Batc field.';
                }
                field("Invoice default G/L Account"; Rec."Invoice default G/L Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice default G/L Account field.';
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
