namespace MNB;

permissionset 65406 "SalesUserPerm"
{
    Assignable = true;

    Permissions =
        tabledata "MNB Sales Header Local" = RIM,
        tabledata "MNB Customer" = R,
        tabledata "MNB Sales Approval Log" = R;
}
