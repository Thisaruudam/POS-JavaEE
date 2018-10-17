$("#btnSaveCustomer").click(function () {
    $("#frmSaveCustomer").attr("action", "save-customer");
    $("#frmSaveCustomer").submit();
});
$("#btnAddCustomer").click(function () {
    $("#formCustomer").attr("action", "add-customers.html");
    $("#formCustomer").submit();
});
$("#btnUpdateCustomer").click(function () {
    $("#frmUpdateCustomer").attr("action", "update-customer");
    $("#frmUpdateCustomer").submit();
});
$("#btnDelete").click(function () {
    $("#formCustomer").attr("action", "delete-customers");
    $("#formCustomer").submit();
});


$("#btnSaveItem").click(function () {
    $("#frmSaveItem").attr("action", "save-item");
    $("#frmSaveItem").submit();
});
$("#btnAddItem").click(function () {
    $("#frmItem").attr("action", "add-item.html");
    $("#frmItem").submit();
});
$("#btnUpdateItem").click(function () {
    $("#frmUpdateItem").attr("action", "update-item");
    $("#frmUpdateItem").submit();
});
$("#btnDeleteItem").click(function () {
    $("#frmItem").attr("action", "delete-items");
    $("#frmItem").submit();
});


// $("#btnPlaceOrder").click(function () {
//     $("#frmPlaceOrder").attr("action", "place-order");
//     $("#frmPlaceOrder").submit();
// });
