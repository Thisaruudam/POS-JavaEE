package service;

import db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/save-customer")
public class SaveCustomer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("txtID");
        String name = request.getParameter("txtName");
        String address = request.getParameter("txtAddress");
        String salary = request.getParameter("txtSalary");

        Connection connection= DBConnection.getConnetcion();

        int affectedRows = -1;

        try {
            PreparedStatement pstm = connection.prepareStatement("INSERT INTO Customer VALUES (?,?,?,?)");

            pstm.setObject(1,cid);
            pstm.setObject(2,name);
            pstm.setObject(3,address);
            pstm.setObject(4,salary);

            affectedRows = pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.setContentType("text/html");
        try(PrintWriter out = response.getWriter()){

            if (affectedRows > 0){

                response.sendRedirect("manage-customers.jsp");

            }else{

                out.println("<h1>Failed to save the customer</h1>");
            }

            out.println("<a href=\"add-customer.html\">Go to Save Customer</a>");

        }

    }
}
