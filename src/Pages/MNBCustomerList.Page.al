namespace MNB;

page 65421 "MNB Customer List"
{
    PageType = List;
    SourceTable = "MNB Customer";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Customer number';
                }
                field("Name"; Rec."Name")
                {
                    ToolTip = 'Customer name';
                }
                field("Credit Limit"; Rec."Credit Limit")
                {
                    ToolTip = 'Credit limit';
                }
                field("Balance"; Rec."Balance")
                {
                    ToolTip = 'Current balance';
                }
            }
        }
    }
}