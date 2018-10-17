<%--
  Created by IntelliJ IDEA.
  User: thisaru
  Date: 3/6/18
  Time: 6:25 PM
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
                    <a class="nav-link active" href="manage-customers.jsp">Manage Customers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="manage-items.jsp">Manage Items</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="place-order.jsp">Place Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ">Reports</a>
                </li>
            </ul>
        </nav>

        <main class="col-sm-9 ml-sm-auto col-md-10 pt-3" role="main">

            <h1>Manage Customers</h1>

            <section class="row text-center placeholders">

                <form id="frmUpdateCustomer" action="js/controller.js" method="post" class="form-control">
                    <div class="sec">

                        <div class="row">
                            <div class="col-sm-3 lbl">
                                <label>Customer ID</label>
                            </div>
                            <div class="col-sm-9">
                                <input name="txtID" id="txtCustomerID" class="form-control" value="<%= request.getParameter("id")%>" readonly>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-sm-3 lbl">
                                <label>Customer Name</label>
                            </div>
                            <div class="col-sm-9">
                                <input name="txtName" id="txtCustomerName" class="form-control" value="<%= request.getParameter("name")%>">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-sm-3 lbl">
                                <label>Customer Address</label>
                            </div>
                            <div class="col-sm-9">
                                <input name="txtAddress" class="form-control" value="<%= request.getParameter("address")%>">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-sm-3 lbl">
                                <label>Customer Salary</label>
                            </div>
                            <div class="col-sm-9">
                                <input name="txtSalary" class="form-control" value="<%= request.getParameter("salary")%>">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-sm-10"></div>
                            <div class="col-sm-2">
                                <button type="button" class="btn btn-primary" id="btnUpdateCustomer">UPDATE</button>
                            </div>
                        </div>

                    </div>
                </form>

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
</body>
</html>


