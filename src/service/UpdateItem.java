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

@WebServlet(urlPatterns = "/update-item")
public class UpdateItem extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String iid = request.getParameter("txtID");
        String description = request.getParameter("txtDescription");
        String qtyOnHand = request.getParameter("txtQtyOnHand");
        String price = request.getParameter("txtPrice");

        Connection connection = DBConnection.getConnetcion();

        try {
            PreparedStatement pstm = connection.prepareStatement("UPDATE Item SET description=?, qtyOnHand=?, unitPrice=? WHERE iid=?");

            pstm.setObject(1,description);
            pstm.setObject(2,qtyOnHand);
            pstm.setObject(3,price);
            pstm.setObject(4,iid);

            int affectedRows = pstm.executeUpdate();

            response.setContentType("text/html");
            try(PrintWriter out = response.getWriter();){

                if (affectedRows > 0) {
                    response.sendRedirect("manage-items.jsp");
                }else{
                    out.println("<h1>Item Update Failed</h1>");
//                    response.sendRedirect("manage-customers.jsp");
                }

            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
