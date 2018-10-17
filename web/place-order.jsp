<%@ page import="java.sql.Connection" %>
<%@ page import="db.DBConnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: thisaru
  Date: 3/6/18
  Time: 8:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JAVA EE POS - IJSE : </title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate.css">
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="index.jsp">JAVA EE - POS</a>
    <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault"
            aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>

        </ul>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar">
            <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                    <a class="nav-link " href="index.jsp">Overview <span
                            class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="manage-customers.jsp">Manage Customers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="manage-items.jsp">Manage Items</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="place-order.jsp">Place Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ">Reports</a>
                </li>
            </ul>
        </nav>

        <main class="col-sm-9 ml-sm-auto col-md-10 pt-3" role="main">

            <h1>Palce Order</h1>


            <section class="invoice">
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-12">
                            <!-- general form elements -->
                            <div class="box box-solid">
                                <form id="frmPlaceOrder">

                                <div class="box-body">
                                    <div class="form-group">
                                        <label>Order ID</label>
                                        <input name="txtOID" id="txtOID" class="form-control" placeholder="O001">
                                    </div>
                                    <div class="form-group">
                                        <label>Order Date</label>
                                        <input id="orderDate" name="orderDate" class="form-control" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Customer ID</label>
                                        <select class="form-control" name='custID' id='cmbCustomerId'>
                                            <%
                                                Connection connection = DBConnection.getConnetcion();

                                                try {

                                                    Statement stm = connection.createStatement();

                                                    ResultSet rst = stm.executeQuery("SELECT * FROM Customer");

                                                    while (rst.next()) {
                                                        String cid = rst.getString(1);

                                            %>

                                            <option id="cmbId" value="<%=cid%>"><%=cid%>
                                            </option>

                                            <%
                                                    }
                                                } catch (Exception ex) {
                                                    ex.printStackTrace();
                                                }
                                            %>

                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Customer Name</label>
                                        <input id="custName" name="txtName" class="form-control" value="" readonly>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>Item Code</label>
                                            <select id="cmbItemId" class="form-control">
                                                <%

                                                    try {

                                                        Statement stm = connection.createStatement();

                                                        ResultSet rst = stm.executeQuery("SELECT * FROM Item");

                                                        while (rst.next()) {
                                                            String iid = rst.getString(1);

                                                %>

                                                <option value="<%=iid%>"><%=iid%>
                                                </option>

                                                <%
                                                        }
                                                    } catch (Exception ex) {
                                                        ex.printStackTrace();
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Description</label>
                                            <input id="description" name="" class="form-control" readonly>
                                        </div>
                                        <div class="col-md-2">
                                            <label>Unit Price</label>
                                            <input id="price" name="" class="form-control" readonly>
                                        </div>
                                        <div class="col-md-2">
                                            <label>QTY On Hand</label>
                                            <input id="qtyOnHand" name="" class="form-control" readonly>
                                        </div>
                                        <div class="col-md-3">
                                            <label>QTY Ordered</label>
                                            <input id="qtyOrdered" class="form-control ">
                                            <button id="btnAddToTable" type="button" class="butt js--triggerAnimation"
                                                    style="visibility: hidden" onclick="addTable()"></button>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <table class="table table-active table-hover" id="tableN">
                                                <thead style="background-color: #001F3F;color: white">
                                                <tr>
                                                    <th>Item ID</th>
                                                    <th>Description</th>
                                                    <th>Unit Price</th>
                                                    <th>QTY</th>
                                                    <th>Total</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody class="wobble">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                                <div class="row">
                                    <div class="col-md-1"></div>
                                    <div class="col-md-1">
                                        <label>Total</label>
                                    </div>
                                    <div class="col-md-2">
                                        <input id="finalTotal" name="total" class="form-control">
                                    </div>
                                    <div class="col-md-5">
                                    </div>
                                    <div class="col-md-1">
                                        <button type="button" id="btnPlaceOrder" class="btn bg-success">PLACE ORDER
                                        </button>
                                    </div>
                                    <div class="col-md-1"></div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
            </section>


            <footer>
                <hr>
                <div>
                    <img src="images/ijse-logo.png">
                    <small>Institute of Software Engineering</small>
                </div>
            </footer>
        </main>
    </div>
</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/controller.js"></script>
<script src="js/placeOrder-script.js"></script>
<script src="js/bootstrap-notify.js"></script>
<script src="js/ajax-script.js"></script>
</body>
</html>
