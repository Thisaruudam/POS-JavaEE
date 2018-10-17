$("#qtyOrdered").submit(function () {
    return false;
});

$("#qtyOrdered").keyup(function (event) {
    if(event.keyCode===13){
        $("#btnAddToTable").click();
    }
});

var tot=0;

function addTable() {
    var description=$('#description').val();
    var price=$('#price').val();
    var qtyOnHand=$("#qtyOnHand").val();
    var qtyOrderedBefore=$("#qtyOrdered").val();
    var qtyOnHand1=qtyOnHand-qtyOrderedBefore;
    if(qtyOnHand>qtyOrderedBefore){
        var qtyOrdered=$("#qtyOrdered").val();
        var unitPrice=$("#price").val();
        var total=qtyOrdered*unitPrice;
        tot=tot+total;
        //$("#itemID").attr("value",id);
        $("#tableN tbody").append('<tr class="lbl">' +
            '<input name="itemCode" id="itemID" type="hidden" value=" '+ $('#cmbItemId').val() + '" > ' +
            '<input name="itemQty" type="hidden" value=" '+ qtyOnHand1 + '" > ' +
            '<td>' + $('#cmbItemId').val() + '</td>' +
            '<td>' + description + '</td>' +
            '<td>' + price + '</td>' +
            '<td>' + qtyOrdered + '</td>' +
            '<td>' + total + '</td>' +
            '<td class="fa fa-trash" style="cursor: pointer;color: red;font-size: 20px" onclick="deleteRow(this)"></td>' +
            '</tr>');

        $("#cmbItem1").focus();
        $("#qtyOrdered").val("");
        $("#description").val("");
        $("#qtyOnHand").val("");
        $("#price").val("");
        $("#finalTotal").val(tot);
    }else{
        alert("Not Enough Quantity.... Please Try Different...");
    }
}

function deleteRow(selected) {
    var row = $(selected).parents("tr");
    $(row).fadeOut(400);
    tot=0;
    setTimeout(function () {
        $(row).remove();
        $('#finalTotal').val("");
        $("#cmbItem1").focus();
    }, 500);
}

var date=new Date().toLocaleDateString()
$("#orderDate").val(date);

