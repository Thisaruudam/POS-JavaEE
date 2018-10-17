<%@ page import="java.sql.Connection" %>
<%@ page import="db.DBConnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: thisaru
  Date: 3/6/18
  Time: 7:39 PM
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
                    <a class="nav-link" href="index.jsp">Overview <span
                            class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="manage-customers.jsp">Manage Customers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="manage-items.jsp">Manage Items</a>
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

            <h1>Manage Items</h1>


            <form action="js/controller.js" method="post" enctype="application/x-www-form-urlencoded" id="frmItem">

                <div class="bGroup">
                    <button class="btn btn-info" id="btnAddItem" type="button">New Item</button>
                    <button class="btn btn-danger" id="btnDeleteItem" type="button">Delete</button>
                </div>

                <div>
                    <table id="tblItem" class="table table-active table-bordered">
                        <thead>
                        <tr>
                            <th></th>
                            <th>Item ID</th>
                            <th>Description</th>
                            <th>Qty On Hand</th>
                            <th>Unit Price</th>
                            <th class="r"></th>
                        </tr>
                        </thead>
                        <tbody>

                        <%
                            Connection connection = DBConnection.getConnetcion();

                            try {

                                Statement stm = connection.createStatement();

                                ResultSet rst = stm.executeQuery("SELECT * FROM Item");

                                while (rst.next()) {
                                    String iid = rst.getString(1);
                                    String description = rst.getString(2);
                                    int QtyOnHand = rst.getInt(3);
                                    double price = rst.getDouble(4);

                        %>

                        <tr style="text-align: left">
                            <td><input type="checkbox" name="itemId" value="<%= iid %>"></td>
                            <td><%= iid %></td>
                            <td><%= description %></td>
                            <td><%= QtyOnHand %></td>
                            <td><%= price %></td>
                            <td><a href='update-item.jsp?id=<%= iid %>&&description=<%= description %>&&qtyOnHand=<%= QtyOnHand %>&&price=<%= price %>'><i
                                    class="fa fa-pencil" aria-hidden="true"></i></a></td>
                        </tr>

                        <%

                                }

                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }


                        %>


                        </tbody>

                    </table>
                </div>

            </form>

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

