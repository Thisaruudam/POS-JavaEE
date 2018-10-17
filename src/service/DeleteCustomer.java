package service;

import db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(urlPatterns = "/delete-customers")
public class DeleteCustomer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String [] ids=request.getParameterValues("custId");
        Connection conn= DBConnection.getConnetcion();
        for (String id : ids) {
            String SQL="Delete From Customer where cid='"+id+"'";
            Statement stm= null;
            try {
                stm = conn.createStatement();
                if (stm.executeUpdate(SQL)>0){

                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("manage-customers.jsp");
    }

}

