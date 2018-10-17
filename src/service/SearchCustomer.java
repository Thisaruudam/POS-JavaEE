package service;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
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
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet(urlPatterns = "/search-customer")
public class SearchCustomer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String customerId = (req.getParameter("id"));

        Connection connection = DBConnection.getConnetcion();

        try {
            PreparedStatement pstm = connection.prepareStatement("SELECT * FROM Customer WHERE cid=?");

            pstm.setObject(1, customerId);

            ResultSet rst = pstm.executeQuery();

            resp.setContentType("application/json");

            try(PrintWriter out = resp.getWriter();){


                if (rst.next()) {
                    Gson gson = new Gson();
                    JsonElement element = gson.toJsonTree(rst.getString(2));
                    out.write(element.toString());
                }

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
