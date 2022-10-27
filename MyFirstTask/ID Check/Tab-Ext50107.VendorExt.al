tableextension 50107 "Vendor Ext" extends Vendor
{
    fields
    {
        modify("VAT Registration No.")
        {
            trigger OnAfterValidate()
            var
                VATAgent: Record "VAT Registration Log";
                Txt001: Label 'Identification number %1 was not found on RS.GE';
            begin
                VATAgent.SetRange("VAT Registration No.", "VAT Registration No.");
                if not VATAgent.FindFirst() then
                    Message(Txt001, "VAT Registration No.");
            end;
        }
    }
}
