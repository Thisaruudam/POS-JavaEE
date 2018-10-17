$("#cmbCustomerId").change(function(){

    var cid = encodeURIComponent($("#cmbCustomerId").val());

    $.get('search-customer?id='+cid,{},function (response) {
        $("#custName").val(response);
    });
});

$("#cmbItemId").change(function(){

    $('#qtyOrdered').val("");

    var itemId = encodeURIComponent($("#cmbItemId").val());

    $.get('search-item?id='+itemId,{},function (response) {

        $("#description").val(response[0].description);
        $("#qtyOnHand").val(response[0].qtyOnHand);
        $("#price").val(response[0].unitPrice);
    });

});

$("#btnPlaceOrder").click(function(){

    var httpRequest1 = new XMLHttpRequest();

    httpRequest1.onreadystatechange = function(){
        if (httpRequest1.readyState === 4 & httpRequest1.status === 200){
            var result=httpRequest1.responseText;

        }
    };

    $.post("place-order",$('#frmPlaceOrder').serialize(),function (response) {

        // var result=response.trim();
        //
        // var message;
        // if(result==='Added'){
        //     var type="success";
        //     message="<strong style='font-size: 20px'>Order Has been Successfully Placed</strong>"+"<br>"+"If You Want to Redirects Please Click This Notification...";
        //     $("#cmbItem1").focus();
        //     $("#qtyOrdered").val("");
        //     $("#description").val("");
        //     $("#qty").val("");
        //     $("#prrice").val("");
        //     $("#finalTotal").val("");
        //     $("#tableN tbody tr").remove();
        // }else {
        //     var type="danger";
        //     message="Failed To Add Order Please Try Again";
        //     $("#cmbItem1").focus();
        //     $("#qtyOrdered").val("");
        //     $("#description").val("");
        //     $("#qty").val("");
        //     $("#price").val("");
        //     $("#finalTotal").val("");
        //     $("#tableN tbody tr").remove();
        // }
        // $.notify(
        //     {
        //         message: message,
        //         url: "place-order.jsp",
        //         target: "_self"
        //     },
        //     {
        //         type: type,
        //         spacing: 10,
        //         z_index: 1031,
        //         delay: 5000,
        //         animate: {
        //             enter: 'animated rubberBand',
        //             exit: 'animated lightSpeedOut'
        //         },
        //     }
        // );

    });
});