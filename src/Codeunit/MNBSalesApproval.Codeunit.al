namespace MNB;

codeunit 65405 "MNB Sales Approval"
{
    procedure SendForApproval(var SalesHeader: Record "MNB Sales Header Local")
    var
        Customer: Record "MNB Customer";
    begin

        if not Customer.Get(SalesHeader."Customer No.") then
            Error('Customer %1 not found', SalesHeader."Customer No.");

        if Customer.Balance > Customer."Credit Limit" then
            Error('Customer %1 exceeds credit limit. Cannot send for approval.', Customer.Name);

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