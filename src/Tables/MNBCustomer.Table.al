namespace MNB;

table 65420 "MNB Customer"
{
    Caption = 'Customer';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }

        field(2; "Name"; Text[50])
        {
            Caption = 'Name';
        }

        field(3; "Credit Limit"; Decimal)
        {
            Caption = 'Credit Limit';
        }

        field(4; "Balance"; Decimal)
        {
            Caption = 'Balance';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}