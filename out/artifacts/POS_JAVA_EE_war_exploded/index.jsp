<%@ page import="java.sql.Connection" %>
<%@ page import="db.DBConnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String cid="";
    String iid="";
    String oid="";
    String total="";

    Connection connection = DBConnection.getConnetcion();

    Statement stm1 = connection.createStatement();
    Statement stm2 = connection.createStatement();
    Statement stm3 = connection.createStatement();
    Statement stm4 = connection.createStatement();

    String sql1="select count(cid) from Customer";
    String sql2="select count(iid) from Item";
    String sql3="select count(oid) from Orders";
    String sql4="select sum(total) from Orders";

    ResultSet resultSet1 = stm1.executeQuery(sql1);
    ResultSet resultSet2 = stm2.executeQuery(sql2);
    ResultSet resultSet3 = stm3.executeQuery(sql3);
    ResultSet resultSet4 = stm4.executeQuery(sql4);

    if(resultSet1.next()){
        cid = resultSet1.getString(1);
    }

    if(resultSet2.next()){
        iid = resultSet2.getString(1);
    }

    if(resultSet3.next()){
        oid = resultSet3.getString(1);
    }

    if(resultSet4.next()){
        total = resultSet4.getString(1);
    }


%>


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
                    <a class="nav-link active " href="index.jsp">Overview <span
                            class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="manage-customers.jsp">Manage Customers</a>
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

            <h1>Overview</h1>

            <section class="row text-center placeholders" class="text-over">
                <div class="col-6 col-sm-3 placeholder">
                    <img src="data:image/gif;base64,R0lGODlhAQABAIABAAJ12AAAACwAAAAAAQABAAACAkQBADs=" width="200"
                         height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                    <label class="centered"><%=cid%></label>
                    <h4>Customers</h4>
                    <div class="text-muted">Total Customers</div>
                </div>
                <div class="col-6 col-sm-3 placeholder" class="text-over">
                    <img src="data:image/gif;base64,R0lGODlhAQABAIABAADcgwAAACwAAAAAAQABAAACAkQBADs=" width="200"
                         height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                    <label class="centered"><%=iid%></label>
                    <h4>Items</h4>
                    <span class="text-muted">Total Items</span>
                </div>
                <div class="col-6 col-sm-3 placeholder" class="text-over">
                    <img src="data:image/gif;base64,R0lGODlhAQABAIABAAJ12AAAACwAAAAAAQABAAACAkQBADs=" width="200"
                         height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                    <label class="centered"><%=oid%></label>
                    <h4>Orders</h4>
                    <span class="text-muted">Today Orders</span>
                </div>
                <div class="col-6 col-sm-3 placeholder" class="text-over">
                    <img src="data:image/gif;base64,R0lGODlhAQABAIABAADcgwAAACwAAAAAAQABAAACAkQBADs=" width="200"
                         height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                    <label class="centered1"><%=total%></label>
                    <h4>Earnings</h4>
                    <span class="text-muted">Today Earnings</span>
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
</body>
</html>
