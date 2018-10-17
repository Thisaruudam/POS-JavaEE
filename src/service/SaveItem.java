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

@WebServlet(urlPatterns = "/save-item")
public class SaveItem extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String iid = request.getParameter("txtID");
        String description = request.getParameter("txtDescription");
        String qtyOnHand = request.getParameter("txtQtyOnHand");
        String price = request.getParameter("txtPrice");

        Connection connection= DBConnection.getConnetcion();

        int affectedRows = -1;

        try {
            PreparedStatement pstm = connection.prepareStatement("INSERT INTO Item VALUES (?,?,?,?)");

            pstm.setObject(1,iid);
            pstm.setObject(2,description);
            pstm.setObject(3,qtyOnHand);
            pstm.setObject(4,price);

            affectedRows = pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.setContentType("text/html");
        try(PrintWriter out = response.getWriter()){

            if (affectedRows > 0){

                response.sendRedirect("manage-items.jsp");

            }else{

                out.println("<h1>Failed to save the customer</h1>");
            }


        }

    }
}
