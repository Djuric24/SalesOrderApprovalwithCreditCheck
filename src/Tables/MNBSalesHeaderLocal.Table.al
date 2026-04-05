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
            TableRelation = "MNB Customer"."No.";
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