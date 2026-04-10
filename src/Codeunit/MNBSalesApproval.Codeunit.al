namespace MNB;

codeunit 65405 "MNB Sales Approval"
{
    procedure SendForApproval(var SalesHeader: Record "MNB Sales Header Local")
    var
        Customer: Record "MNB Customer";
    begin

        if not Customer.Get(SalesHeader."MNB Customer No.") then
            Error('Customer %1 does not exist.', SalesHeader."MNB Customer No.");

        if (Customer.Balance + SalesHeader.Amount) > Customer."Credit Limit" then
            Error('Credit limit exceeded for customer %1. Available: %2, Attempted: %3',
                Customer.Name, Customer."Credit Limit" - Customer.Balance, SalesHeader.Amount);

        SalesHeader."MNB Credit Checked" := true;
        SalesHeader."MNB Approval Status" := SalesHeader."MNB Approval Status"::"Pending Approval";
        SalesHeader.Modify();
    end;

    procedure Approve(var SalesHeader: Record "MNB Sales Header Local")
    begin
        if UserId <> 'ADMIN' then
            Error('Only ADMIN can approve.');

        SalesHeader."MNB Approval Status" := SalesHeader."MNB Approval Status"::Approved;
        SalesHeader.Modify();
    end;

    procedure Reject(var SalesHeader: Record "MNB Sales Header Local")
    begin
        if UserId <> 'ADMIN' then
            Error('Only ADMIN can reject (test mode).');

        SalesHeader."MNB Approval Status" := SalesHeader."MNB Approval Status"::Rejected;
        SalesHeader.Modify();
    end;
}