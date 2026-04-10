namespace MNB;
table 65401 "MNB Sales Header Local"
{
    Caption = 'MNB Sales Header Local';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }

        field(2; "Customer Name"; Text[50])
        {
            Caption = 'Customer Name';

        }
        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
        }
        field(4; "Amount"; Decimal)
        {
            Caption = 'Amount';
        }
        field(30; "MNB Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = "MNB Customer"."No.";

            trigger OnValidate()
            var
                Customer: Record "MNB Customer";
            begin
                if Customer.Get("MNB Customer No.") then
                    "Customer Name" := Customer.Name;
            end;
        }

        field(32; "MNB Credit Checked"; Boolean)
        {
            Caption = 'Credit Checked';
        }

        field(33; "MNB Approval Status"; Enum "MNB Sales Approval Status")
        {
            Caption = 'Approval Status';
        }
    }

    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
    }
}