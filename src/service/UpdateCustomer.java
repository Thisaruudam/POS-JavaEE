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

@WebServlet(urlPatterns = "/update-customer")
public class UpdateCustomer extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("txtID");
        String name = request.getParameter("txtName");
        String address = request.getParameter("txtAddress");
        String salary = request.getParameter("txtSalary");

        Connection connection = DBConnection.getConnetcion();

        try {
            PreparedStatement pstm = connection.prepareStatement("UPDATE Customer SET name=?, address=?, salary=? WHERE cid=?");

            pstm.setObject(1,name);
            pstm.setObject(2,address);
            pstm.setObject(3,salary);
            pstm.setObject(4,cid);

            int affectedRows = pstm.executeUpdate();

            response.setContentType("text/html");
            try(PrintWriter out = response.getWriter();){

                if (affectedRows > 0) {
                    response.sendRedirect("manage-customers.jsp");
                }else{
                    out.println("<h1>Customer Update Failed</h1>");
//                    response.sendRedirect("manage-customers.jsp");
                }

            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
